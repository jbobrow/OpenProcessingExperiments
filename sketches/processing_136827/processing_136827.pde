
int randomX;
int randomY;
int alpha;
int randomH;
int randomW;
int triangle;



void setup(){
 
size(740,900);
background(165,150,135);
noStroke();
}

void draw(){

}
 
 
void mouseMoved () {
  
 stroke(255,alpha); 
 strokeWeight(random(0,4));
 line(370,450,mouseX,mouseY);
 
 
/* stroke(162,alpha);
 strokeWeight(1);
 line(0,0,mouseX,mouseY); */
 
 
 /*stroke(80,alpha);
 strokeWeight(1);
 line(740,900,mouseX,mouseY); */

 alpha = int(random(10,90));

 

}

void keyPressed(){
  

  
    if(keyCode == 'b' || keyCode== 'B'){
       addYellow();
    }
    else if(keyCode == 'n' || keyCode=='N'){
       addPink();
    }
    else if(keyCode == 'm' || keyCode=='M'){
       addBlue();
    }
}


