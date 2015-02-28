
Thing marcos;

void setup(){
size(100,100);
marcos = new Thing();
frameRate(2);
}

void draw(){
background(0);
marcos.soul();
marcos.vitalSystem();
marcos.corpus(50,50);
}

class Thing{

Thing(){
}

void vitalSystem(){
if(random(0,1)<0.5){
stroke(255,0,0);
}else{
stroke(0,0,255);
}
}

void corpus(int x,int y){
point(x,y,0);
}

void soul(){
 //floating between 0 and 1
}

}

                
                
