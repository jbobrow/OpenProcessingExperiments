
/* Esta cabecera permite usar los objetos que encapsulan los descriptores stdout 
y stdin: cout(<<) y cin(>>)*/
#include <iostream>
 
int main()
{
    std::cout << "Hola mundo" << std::endl;
    std::cin.get();
}
