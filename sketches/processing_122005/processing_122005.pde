
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mike
{
    class Program
    {
        static void Main(string[] args)
        {

            double fuerza = 0d, masa = 0d, aceleracion = 0d;
            

            Console.WriteLine("ingresa el valor de la masa");
            masa = double.Parse(Console.ReadLine());
            Console.WriteLine("ingresa el valor de Aceleracion");
            aceleracion = double.Parse(Console.ReadLine());

            {
                if (masa < 1000)  
                
                {
                    fuerza = masa * aceleracion;
                
                
                }


            }
            Console.WriteLine(" El Resultado es: {0}",fuerza);
            {
                Console.ReadKey();
            
            }


            






        }
    }
}

