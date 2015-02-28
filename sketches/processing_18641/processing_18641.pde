
float counter=0.5;
float counterMax=250;
 
void setup(){
    size(250,250);
    background(0);
    smooth();
}
 
void draw(){
   stroke(color(random(100),random(50),random(100),20));
   strokeWeight(counter);
   line(320,180,40,40);
   
   stroke(color(random(50),random(110),random(10),20));
   strokeWeight(counter);
   line(320,90,50,20);
   
   stroke(color(random(200),random(200),random(200),20));
   strokeWeight(counter);
   line(40,300,20,50);
   
   stroke(color(random(40),random(50),random(80),20));
   strokeWeight(counter);
   line(90,300,20,20);
   
   stroke(color(random(10),random(10),random(10),20));
   ellipse(40,40,40,40);
   fill(200,60,60,20);
   
    if(counter<counterMax){
        counter++;
    }
   else {
        counter=30;
    }
}


