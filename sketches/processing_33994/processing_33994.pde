
int i = 0;  
int rad =400;
int pressCount = 0;
int alfa = 80;

void setup() {  
    size(900, 450);   
    background(255);  
    smooth();  
    strokeWeight(5);  
    frameRate(15);  
}   
void draw() {  //r g b a

     if(key=='e'){   
     fill(random(225)); 
     ellipse(i,250 ,0,random(rad));
     if (i < width) {  
        i+=5;  
    } else {  
        i = 0;    
    }
   } 

    if(key=='l'){
    stroke(random(255), random(255), random(255), alfa);  
    line (i,250 ,random(width),random(height));  
    if (i < width) {  
        i+=5;  
    } else {  
        i = 0;    
    }
    } 
  }

void mousePressed(){
   fill(50,50,50);  
   strokeWeight(20);
   pressCount ++;
 if(pressCount>=5){
   alfa=20;
 }
 if(pressCount>=10){
   alfa=80;
   
}
}
void mouseReleased(){  
  strokeWeight(7);
}
void keyPressed(){    //if b or a is pressed on our keyboard
 if(key=='b'|| key=='a'){
   background(0); 
 }
 
if(key=='c'|| key=='d'){    //starting over
   background(255); 
 }

}


 


//timing




  










   

