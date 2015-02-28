
int[] numbers1 = new int[8];
int[] numbers2 = new int[8];
int[] numbers3 = new int[8];
int[] numbers4 = new int[8];
for (int x=0; x<=8; x++)
{
    numbers1[x]=round(random(10));
    
    }
for (int x=0; x<=8; x++)
{
    numbers2[x]=round(random(10));
    
    }
for(int y=0; y<=8; y++)
{
    numbers3[y]=numbers1[y]+numbers2[y];
}
for(int y=0; y<=8; y++)
{
    numbers4[y]=numbers1[y]-numbers2[y];
}
println(numbers1);
println(numbers2);
println("Suma___________________");
println(numbers3);
println("Resta___________________");
println(numbers4);

void setup() {
 int e=0;
 int f=0;
 int e1=0;
 int f1=0;
 int e2=0;
 int f2=0;
 int e3=0;
 int f3=0;
 smooth();
    background(10, 10, 10);
    size(400,400);
    stroke(250, 250, 250);
    strokeWeight(3);
    line(50,50,50,150);
    line(150,50,150,150);
    line(200,50,200,150);
    line(300,50,300,150);
    line(50,200,50,300);
    line(150,200,150,300);
    line(200,200,200,300);
    line(300,200,300,300);
   for(int w=0; w<=8; w++){
    text("Matriz 1",50,40);
    text(""+numbers1[w],60+e,60+f);
    text("Matriz 2",200,40);
    text(""+numbers2[w],210+e1,60+f1);
    text("Suma",50,190);
    text(""+numbers3[w],60+e2,220+f2);
    text("Restar",200,190);
    text(""+numbers4[w],210+e3,220+f3);
    e=e+35;
    e1=e1+35;
    e2=e2+35;
    e3=e3+35;
    if(w===2){
  
        f=f+40;
        f1=f1+40;
        f2=f2+40;
        f3=f3+40;
        e=0;
        e1=0;
        e2=0;
        e3=0;
        }
    if(w===5){
  
       f=f+40;
       f1=f1+40;
       f2=f2+40; 
       f3=f3+40;
        e=0;
        e1=0;
        e2=0;
        e3=0;
        }
    }
   
    
}
