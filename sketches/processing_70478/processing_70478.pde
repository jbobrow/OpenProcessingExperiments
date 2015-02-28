
int i;
char nombre[] = {'G', 'a', 'b', 'r','i','e', 'l','.'};
int rando[] = new int[10];
float cambio =200;
void setup()
{
  size(600, 600); 
  fill(#FA7F42); 
  frameRate(20);
}
void draw()
{
    background(#5D26C6);
    textFont(createFont("Vivaldi",60)); 
    
    for(i=0;i<10;i++)
      rando[i] = (int)random(0,100);
    cambio-=1;
    if(cambio<=0)
    {
      text("Gabriel.",250, 250);
    }
    else
    {
      for(i=0;i<=4;i++)
        text(nombre[i],cambio*cos(cambio)+250+rando[i],cambio*sin(cambio)+250+rando[i+1]);
    }
   
}


