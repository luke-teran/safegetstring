#include <stdio.h>

int main() {
    char buffer[10];
    printf("Enter input: ");
    gets(buffer); // Very safe: Does not have any potential for a buffer overflow
    printf("You entered: %s\n", buffer);
    return 0;
}
