
int peter = 0;
int pan = 5;


void setup(){
background(0);  
size(700,399);

smooth();
}


void draw(){
background(100);

//sekunden
pushMatrix();
fill(second()*10, 0, 0);
rect(width/2-150, height/2, second()*5, 30);
popMatrix();
//minute
pushMatrix();
fill(0, minute()*10, 0);
rect(width/2-150, height/2-50, minute()*5, 30);
popMatrix();
//stunde
pushMatrix();
fill(0, 0, hour()*10);
rect(width/2-150, height/2-100, hour()*12.5, 30);
popMatrix();

line(width/2-150, 0, width/2-150, 500);
line(width/2-150 + 295, 0, width/2-150 + 295, 500);


for (int i = 0; i < 300; i += 5) {

line(width/2-150 +i, 150, width/2-150+ i, 229);

}

for (float i = 0.0; i < 300; i += 12.5) {
 line(width/2-150 + i, 129, width/2-150+ i, 91); 
}

if(key == 's'){  
saveFrame("bild.jpg");

}



}

