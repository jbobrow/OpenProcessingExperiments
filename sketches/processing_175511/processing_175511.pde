
 int count;
 boolean locked;
 RectButton rect1;
     PFont fonti;

 void setup()
  {

    fonti=createFont("fantasy");
    textFont(fonti,44);
   frameRate(10);
    size(400, 360);
    smooth();
    int click = 0;
    buttoncolor = color(102);

    highlight = color(51); 

    rect1 = new RectButton(100, 50, 200, buttoncolor, highlight);
   
    
  }
  
  
  void draw()
  {
    textFont(fonti,44);
    background(255);
    String displaystuff=count.toString();
    fill(0);
    text("Points: " +count, 125,40);
    
 
   
    update(mouseX, mouseY);
    rect1.display();
    if(second%10 !=0 && second()%10 !=0){
      fill(255);
        text("Don't Click", 150,75,100,100);
    }
    else{
      fill(random(255), random(255), random(255));
        text("Click", 150,70,200,100);
        fill(255);
       }
       
      if(count%10 == 0 && count!=0 ){
        fill(random(255), random(255), random(255));
        textFont(fonti,64);
        text("AWESOME!", 70,320);  
      }
  }
  
  
  void update(int x, int y)
  {
     if(locked == false) {

      rect1.update();

  } 

  else {

    locked = false;

  }



  if(mousePressed) {
  
    if(rect1.pressed()) {
        
      if(second()%10 !=0 && second()%10 !=1){
        count =0;
        console.log(second()%10);
      }
       else{
        count++;
        console.log(count);
       }
    }
  }
   
  }
  
  class Button

{

  int x, y;

  int size;

  color basecolor, highlightcolor;

  color currentcolor;

  boolean over = false;

  boolean pressed = false;   



  void update() 

  {

    if(over()) {

      currentcolor = highlightcolor;

    } 

    else {

      currentcolor = basecolor;

    }

  }



  boolean pressed() 

  {

    if(over) {

      locked = true;

      return true;

    } 

    else {

      locked = false;

      return false;

    }    

  }



  boolean over() 

  { 

    return true; 

  }



  boolean overRect(int x, int y, int width, int height) 

  {

    if (mouseX == x && mouseX == x+width && 

      mouseY == y && mouseY == y+height) {

      return true;

    } 

    else {

      return false;

    }

  }



}
  
  class RectButton extends Button

{

  RectButton(int ix, int iy, int isize, color icolor, color ihighlight) 

  {

    x = ix;

    y = iy;

    size = isize;

    basecolor = icolor;

    highlightcolor = ihighlight;

    currentcolor = basecolor;

  }



  boolean over() 

  {

    if( overRect(x, y, size, size) ) {

      over = true;

      return true;

    } 

    else {

      over = false;

      return false;

    }

  }



  void display() 

  {

    stroke(255);

    fill(currentcolor);

    rect(x, y, size, size);

  }

}
  
  
  
  
  
  
  
  
 


