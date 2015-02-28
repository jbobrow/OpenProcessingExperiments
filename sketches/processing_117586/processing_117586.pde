
int myState = 0 ;
int x = 80 ;
int y = 80 ;



void setup() {
  size(600, 600) ;
  smooth () ;
  background(255) ;
  noCursor() ;

}


void draw () {
  
  
  switch(myState) {
        case 0://start screen//
        background(200) ;
        
        fill(0) ;
        textAlign(CENTER) ;
        text("Release the Mouse to Change Shapes and Colors", width/2, height/2) ;
        text("Space = Clear | B = Black", width/2, height/2+20) ;
        text("N = No Stroke | M = Stroke", width/2, height/2+40) ;
        text("Enter | Start", width/2, height/2+200) ;
        println("We are in state 0") ;
        break ;
    
    case 1: //Circle//
    
       
        if (mousePressed){
           fill(random(255), random(200,255), random(250,255), random(0,175));
           ellipse(mouseX-25, mouseY-25, 40, 40);
           ellipse(mouseX+25, mouseY+25, 40, 40);
           
        } 
        else {
          fill((255), random(255), random(255), random(100));
        }
        
        ellipse(mouseX, mouseY, x, y);
        line(mouseX+20, mouseY-35, mouseX-20, mouseY+35) ;
        println("We are in state 1") ;
        break ;
    
    case 2: //Square//
    
      if(mousePressed){
        
        fill(random(200,255), random(200, 255), random(0,100), (255));
        rectMode(CENTER) ;
        rect(mouseX, mouseY, 20, 20) ;
        line(mouseX-10, mouseY+10, mouseX+10, mouseY-10) ;
        
        }
        else {
   
        fill((50), random(200, 255), random(100), random(100,200));
        rectMode(CENTER) ;
        rect(mouseX, mouseY, 40, 40) ;
        line(mouseX-20, mouseY+20, mouseX+20, mouseY-20) ;
      
    }
        println("We are in state 2") ;
        break ;
    
    case 3: //Triangle//
    
    if (mousePressed){
      
      fill(random(235,255), random(150, 200), random(0,100), random(200,255));
      triangle(mouseX-40, mouseY-20, mouseX, mouseY, mouseX-40, mouseY+20);
      triangle(mouseX+40, mouseY-20, mouseX, mouseY, mouseX+40, mouseY+20);
      
      
      
    }
    
    else{
      
      fill(random(200,255), random(0, 55), random(150,255), random(0,255));
      triangle(mouseX-30, mouseY, mouseX, mouseY+75, mouseX+30, mouseY);
      
    }
    
      
        
        println("We are in state 3") ;
        break ;
    
    case 4://rainbow circles//
        
        if (mousePressed) {
    fill(random(200, 255), random(0,25), random(0, 50), random(200,255));
    ellipse(mouseX+15, mouseY+15, 35, 35);
    
    fill(random(0,100), random(150,255), random(150,200), random(200,255));
    ellipse(mouseX-15, mouseY-15, 35, 35);
    
    fill(random(50, 150), random(100,255), random(0, 50), random(200,255));
    ellipse(mouseX+15, mouseY-15, 35, 35);
    
    fill(random(200,255), random(200,255), random(0,50), random(200,255));
    ellipse(mouseX-15, mouseY+15, 35, 35);
    
    fill(0);
    ellipse(mouseX, mouseY, 50, 50);
   
  }
  else {
    fill(random(200, 255), random(0,25), random(0, 50), random(0,55));
    ellipse(mouseX-15, mouseY-15, 100, 100);
    
    fill(random(0,100), random(150,255), random(150,200), random(0,55));
    ellipse(mouseX+15, mouseY+15, 100, 100);
    
    fill(random(50, 150), random(100,255), random(0, 50), random(0,55));
    ellipse(mouseX-15, mouseY+15, 100, 100);
    
    fill(random(200,255), random(200,255), random(0,50), random(0,55));
    ellipse(mouseX+15, mouseY-15, 100, 100);
    
   

  }
    
        
        println("We are in state 4") ;
        break ;
    
    case 5://pale circles//
    
    if (mousePressed) {
        fill(random(0,255), random(0,255), random(0, 255), random(0,100));
        ellipse(mouseX, mouseY, 80, 80);
        ellipse(mouseX-66, mouseY+66, 40, 40) ;
        ellipse(mouseX+66, mouseY-66, 40, 40) ;
       ellipse(mouseX, mouseY+66, 20, 20) ;
        ellipse(mouseX, mouseY-66, 20, 20) ;
    }
    
    else {
       fill(random(0,255), random(0,255), random(0, 255), random(0,50));
        ellipse(mouseX, mouseY, 80, 80);
        ellipse(mouseX-66, mouseY+66, 40, 40) ;
        ellipse(mouseX+66, mouseY-66, 40, 40) ;
      
    }
      
        println("We are in state 5") ;
        break ;
     }
  
}


void mouseReleased() {
   
          myState = myState + 1 ;
          if ( myState > 5) {
          myState = 1 ;}
            
}


void keyPressed() {

  println(keyCode) ;

  switch(keyCode) {
   
    case 10:
    background(255) ;
    myState = 1; 
    break;
       
     case 32: 
       background(255) ;
       println("SPACE/CLEAR") ;
     
     break;
    
     case 66: 
       background(0) ;
       println("BLACK") ;
     break;
     
     case 78:
     noStroke() ;
     break;
     
     case 77:
     stroke(1);
     break;
     
  }
}


