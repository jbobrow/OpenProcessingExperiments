
int d=round(random(100)); 
int t=round(random(10)); 
println("Distacia___________________");
println(d);
println("Tiempo___________________");
println(t);
void setup() {
 int v=d/t;
    smooth();
    background(10, 10, 10);
    size(400,400);
    stroke(250, 250, 250);
    strokeWeight(3);
    
    text("Distancia: " +d +"km",60,120);
    text("Tiempo: " +t,60,140);
    text("Velocidad: " +v +"km/h",60,100);
   for(int x=0;x<=90; x=x+10)
   {
   
   line(60+x,300,60+x,300); 
   }
   
   
}
