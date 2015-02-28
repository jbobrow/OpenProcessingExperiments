
int randomX,randomY;
int preX,preY;
void setup(){
    size(300,300);
    background(255);
    preX=150,preY=150;
    fill(10,10,10);
    text("KimDongEun",150, 150);
    strokeWeight(0.1);
  }
   void draw(){
       if(mousePressed == true){
               preX=mouseX;
               preY=mouseY;
                background(random(300)%60,random(300)%100,random(300)%60);
                text("KimDongEun",mouseX-35, mouseY); 
       }
       else{
           randomX=random(400);
           randomY=random(400);
               
           if((preY-20>randomY || preY+20<randomY)){
              
               fill(200+randomX%50,200+randomY%50,200+random(1000)%50);
               ellipse(randomX,randomY,10+randomX%10,10+randomX%10);
           }
           else{
               fill(200+randomX%50,200+randomY%50,200+random(1000)%50);
               ellipse(randomX,randomY+40,10+randomX%10,10+randomX%10);
           }
       }
  }
                                            
