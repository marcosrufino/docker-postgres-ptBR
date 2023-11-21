
# Dockerfile for PostgreSQL with Brazilian Locale

This Dockerfile is used to create an image of PostgreSQL based on version 9.6 with support for the Brazilian locale (pt_BR.UTF-8).

## Instructions

1. **FROM postgres:9.6**

    Uses the official PostgreSQL image in version 9.6 as the base for building the new image.

2. **Generate the Desired Locales**

```dockerfile
# Generate the desired locales
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
```

3. **Set Environment Variables**
```Generate
# Set the locale
ENV LANG pt_BR.UTF-8
```
  
4. **To build the image, use the following command in the directory where the Dockerfile is located:**
```Generate
# Generate the desired locales
docker build -t your-image-name:tag .
```
 5. **Run the image:**  
```shell
docker run --name <container_name> -e POSTGRES_PASSWORD=password -e POSTGRES_USER=postgres -e POSTGRES_DB=<your_database> -p 5436:5432 -d psql
```
 6. **Restore backup:**

```bash
cat </path/to/your_dump.tar> | docker exec -i <container_name> pg_restore -U postgres -d <your_database>
```
In this command:

- `</path/to/your_dump.tar>`: Reads the content of the dump file named `dump.tar`.
- `|`: The pipe operator redirects the output of the `cat` command to the standard input (`stdin`) of the next command.
- `docker exec -i <container_name> pg_restore -U postgres -d <your_database>`: Executes the `pg_restore` command inside the container named `pg`. The parameters include the user (`postgres`), the target database (`test`), and `-i` to read from the standard input (`stdin`).

Remember to adjust the dump file name (`dump.tar`) and the PostgreSQL container name (`pg`), as well as the user and target database as needed for your specific case.

7. **Useful Commands**

To enter the PostgreSQL container with the user "postgres" using the Docker exec command:
```
docker exec -it -u postgres <container_name> bash
```
Switching to Another Database
```
\c <database_name>
```
Listing the Available Tables in the Current Database
```
\dt
```

Listing the Available Databases

```
\l
```
```
