



void setup(){           
background(255,255,255);
size(400,400); 
}
void draw(){
for (int a = 10%100; a < 400; a = a+80){

stroke(0,0,0);
fill(200,200,200);
rect(a+10,10,random(50),random(50));
rect(a+10,95,random(50),random(50));
rect(a+10,180,random(50),random(50));
rect(a+10,265,random(50),random(50));
rect(a+10,340,random(50),random(50));
}


}

                
