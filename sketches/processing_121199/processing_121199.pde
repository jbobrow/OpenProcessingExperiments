

float counter= 0;
void setup(){
size(500,500);
background(255);
colorMode(HSB, 360, 100, 100);

}

void draw(){
 

translate(sin(counter)*300,0);
 stroke(0,100,random(100));
translate(width/2,height/2);

rotate(radians(random(360)));
line(0,0,0,-800);

counter=counter+0.05;
}

