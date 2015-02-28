
void setup(){
  
 size(800, 600, P3D);
 colorMode(HSB, 100, 100, 100, 100);
}

float y = 0;
float weather_count = 0;
float pink_count = 0;
float pressure_count = 0;
float temp_count = 0;
void draw(){
  
 camera(width/2, height/2+100, 1000, width/2, height/2, 0, 0.0, 1.0, 0.0);
 lights();
 background(100,0,0,100); 
 translate(width/2, height/2+100*sin(pressure_count*0.01), 0);
 y+=(sin(pressure_count*0.01)+1)/5;
 pressure_count++;
 weather_count++;

 //50*sin(weather_count*0.01)+76

if (50*sin(weather_count*0.01)+76-50>0){
  fill(50*sin(weather_count*0.01)+76-50,100,100,100);
  pink_count = 0;
} else {
  pink_count++;
  fill(50*sin(weather_count*0.01)+76-50,(sin(pink_count*0.03+HALF_PI)+1)*100/2,100,100);
}
;
 println(pressure_count);
  if(pressure_count>200){
   rotateY(y);
 } else {
   rotateX(y);
 }
 
 stroke(0,0,100,50);
 line (-400, 0, 0, 400, 0, 0);
 line (0, -400, 0, 0, 400, 0);
 line (0, 0, -400, 0, 0, 400);
 noStroke();
 sphere(150*sin(pressure_count*0.02)+200);


}

