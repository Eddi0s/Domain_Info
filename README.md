# Domain_Info

## Installation and Setup

To use the `server()` script, follow these steps to add it to your `.bashrc` file:

1. Open your terminal.

2. Open the `.bashrc` file using a text editor. For example, you can use `vim`:

   ```bash
   vim ~/.bashrc
   
 3. Scroll to the bottom of the file and paste the code from: domain_info.sh in to the file.



## Usage

The `server()` function retrieves information about a given domain, such as its IP address and server name. It also supports an optional argument to perform an additional action.

To use the script, follow the syntax:


- `<domain>`: The domain name for which you want to retrieve information.
- `-sl` (optional): If provided, it will run the `sl` command with the server name.

## Functionality

The script performs the following steps:

1. The script takes the input domain name and retrieves the IP address using the `host` command and `awk` pattern matching.

2. If the IP address is not found (i.e., empty), the script sets the `$ip` variable to "NOT FOUND" and sets the `$server` variable to "NOT FOUND" as well.

3. If the IP address is found, the script uses the IP address to retrieve the server name using the `host` command, `awk` to extract the last field, and `sed` to remove the trailing dot.

4. If the server name is not found (i.e., empty), the script sets the `$server` variable to "NOT FOUND".

5. The script then prints the retrieved information, including the domain, IP address, and server name (or "NOT FOUND" if applicable).

6. If the optional argument `-sl` is provided, the script executes the `sl` command with the server name as an argument.

## Examples

1. Retrieve information for a domain:

    ```
    server example.com
    ```

    Output:
    ```
    Domain: example.com -- IP: **.***.***.** -- Server: server-example.com
    ```

2. Retrieve information for a non-existent domain:

    ```
    server nonexisting.com
    ```

    Output:
    ```
    Domain: nonexisting.com -- IP: NOT FOUND -- Server: NOT FOUND
    ```

3. Retrieve information for a domain and run `sl` command:

    ```
    server example.com -sl
    ```

    Output:
    ```
     Domain: example.com -- IP: **.***.***.** -- Server: server-example.com
    (sl $Server)
    ```

Please note that the script uses ANSI escape codes (`\e[31m` and `\e[0m`) for color formatting, which may not be supported in all environments.
