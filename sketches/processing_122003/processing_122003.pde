
#include <iostream>
#include <math.h>
#include <stdio.h>
#include <conio.h>

using namespace std;

int main()
{
    int vx,vy,x1,x2,y1,y2,enter,vm;
    float vm2,parteentero,partedecimal;

    termina:
 
    cout<<"Selecciona las siguientes opciones 1 o 2: \n"<<endl;
    cout<<"1.- Para obtener vector de los puntos (x,y),(x2,y2) y obtener su vector , su \n vector magnitud |V| y vector unitario.\n"<<endl;
    cout<<"2.- Para obtener solo magnitud |V| y valor unitario a partit de un vector <x,y>. \n"<<endl;
    cout<<"3.- EXIT para salir de la aplicacion."<<"\n\nOpcion: ";
    cin>>enter;

        if (enter==1)
        {
            cout<<"introduce x: ";
            cin>>x1;
            cout<<"introduce y: ";
            cin>>y1;
            cout<<"introduce x2: ";
            cin>>x2;
            cout<<"introduce y2: ";
            cin>>y2;
            cout<<endl;
            vx=x2-x1;
            vy=y2-y1;
            cout<<" El vector es: <"<<vx<<","<<vy<<">"<<endl;

            vm= (vx*vx)+(vy*vy);
            vm2=sqrt(vm);
            parteentero=(int)vm2;
            partedecimal=vm2-parteentero;
            if(partedecimal==0)
                {
                cout<<" El vector magnitud es: "<<vm2<<endl;
                cout<<" El vector unitario es: <"<<vx<<","<<vy<<"> /"<<vm2<<endl<<endl;
                cout<<"*************************************************"<<endl;

                }
            else
            {
                cout<<" El vector magnitud es: /Raiz de"<<vm<<endl;
                cout<<" El vector unitario es: <"<<vx<<","<<vy<<">/Raiz de "<<vm<<endl<<endl;
                cout<<"*************************************************"<<endl;
            }
            goto termina;
        }




        else
        {
            if(enter==2)
            {
                cout<<"introduce x: ";
                cin>>x1;
                cout<<"introduce y: ";
                cin>>y1;
                cout<<endl;

                vm=(x1*x1)+(y1*y1);
                vm2=sqrt(vm);
                parteentero=(int)vm2;
                partedecimal=vm2-parteentero;
                if (partedecimal==0)
                {
                    cout<<"La magnitud |V| del vector es: "<<vm2<<endl;
                    cout<<" El vector unitario es: <"<<x1<<","<<y1<<">/"<<vm2<<endl<<endl;
                    cout<<"*********************************************"<<endl;

                }
                else
                {
                    cout<<"La magnitud |V| del vector es: /Raiz de "<<vm<<endl;
                    cout<<" El vector unitario es: <"<<x1<<","<<y1<<">/Raiz de "<<vm<<endl<<endl;
                    cout<<"*********************************************"<<endl;

                }
                goto termina;
            }
        }


        if(enter>3)
        {
            /*cout<<"introduce solamente 1 de las 2 opciones."<<endl;
            cout<<"Vuelve a escribir la opcion: ";
            */
            goto termina;
        }
        else
        {
            if(enter==3)
            {
                goto fin;
            }

        }





    fin:
    getch();
    return 0;
}
