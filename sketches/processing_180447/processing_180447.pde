
import processing.serial.*;
parportIO port;
import techne.portIO.*;
int portaddr=0xDF30;
portIO outb=new portIO(portaddr);
portIO inb=new portIO(portaddr+1);

void setup()
{
  size (200,100);
  outb.write(6);
}
void draw()
{
double d=3.675476,temp;
int c,mb,ma,m;

outb.write(4); //start of conversion
for(c=0;c<100;c++)
  d=d/2;

outb.write(6);
delay(1);

outb.write(2);//leggo parte bassa
mb=inb.read();
mb=mb>>3;
mb=mb&0x0F;


ma=0000;
ma=ma&0xF0;

m=ma+mb;
temp=(0.3125*m)-50;
println("Temperatura misurata: "+temp);
delay(1000);

outb.write(6); // resetto adc
}

