
int Xcord1=100;
int Xcord1grow=2;
int Ycord=200;
int Xcon1=250;
int Xcon2=350;
int Ycon1=250;
int Ycon2=350;
int Xcon1grow=5;
int Xcon2grow=-5;
void setup()
{
  size(1000,700);
  
}
void draw()
{
  background(#5CB97C);
bezier(Xcord1,200,Xcon1,Ycon1,Xcon2,150,Xcord1+200,Ycord);
strokeWeight(10);
Xcon1=Xcon1+Xcon1grow;
Xcon2=Xcon2+Xcon2grow;
print("Xcon1=");
println(Xcon1);
print("Xcon2=");
println(Xcon2);
if(Xcon1<150||Xcon1>400)
{
 Xcon1grow =Xcon1grow*(-1);
}
if(Xcon2<150||Xcon2>400)
{
 Xcon2grow =Xcon2grow*(-1);
}
if(Xcord1<50||Xcord1>500)
{
 Xcord1grow =Xcord1grow*(-1);
}
Xcord1=Xcord1+Xcord1grow;
}


