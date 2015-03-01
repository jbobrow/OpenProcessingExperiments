
  PImage currentimage;
  //ImageButton rect1;
  boolean locked = false;
  PImage b;
  Object [] imgFile = new Object[16];
  Object [] testfiles = new Object[8];
  Object [] testpics = new Object[16];
  int numclicks = 0;
  
  PImage x;
  
  Doors [] door = new Doors[8];
  
  
  Oject[] randomFrom(Object [] array) {
      var at = 0;
      var tmp, current, top = array.length;
  
      if(top) while(--top && at++ < array.length) {
          current = Math.floor(Math.random() * (top - 1));
          tmp = array[current];
          array[current] = array[top];
          array[top] = tmp;
      }
  
      return array.slice(-0,-2,-4,-5,-7,-8,-10,-15);
  }
  
  void setup()
  {
    size(800, 200);
    smooth();
    color baseColor = color(102);
   // currentcolor = baseColor;
    color buttoncolor = color(102);
    color highlight = color(51); 
    x = loadImage("1.jpg");
   for(int i = 0; i<imgFile.length; i++){
      imgFile[i]=new Object(i, (Math.floor(Math.random()*15)));
    }
    
    Object [] robs = randomFrom(imgFile);
    
    for(int i = 0; i< door.length; i++){
      door[i] = new Doors((100*i),0, robs[i]);
    }
    frameRate(10);
   
    
  }
  
  
  void draw()
  {
     for(int i = 0; i< door.length; i++){
  
      image(door[i].getObject().getImage(),100*(i%10), 0);
  
    } 
   
    update(mouseX, mouseY, door);
  }
  
  
  void update(int x, int y)
  {
 
    
    if(locked == false && numclicks<=3) {
      door[0].update();
      door[1].update();
      door[2].update();
      door[3].update();
      door[4].update();
      door[5].update();
      door[6].update();
      door[7].update();
     
    } 
    else {
      locked = false;
    }
  
    if(mousePressed) {
      if (numclicks<=2){
        if(door[0].pressed()) {
          numclicks++;
          setup();
         }
        if(door[1].pressed()) {
          numclicks++;
         setup();
         }
        if(door[2].pressed()) {
          numclicks++;
         setup();
        }
        if(door[3].pressed()) {
          numclicks++;
          setup();
        }
        if(door[4].pressed()) {
          numclicks++;
          setup();
        }
        if(door[5].pressed()) {
          numclicks++;
          setup();
        }
        if(door[6].pressed()) {
          numclicks++;
          setup();
        }
        if(door[7].pressed()) {
          numclicks++;
          setup();
        }
      }
      else if(numclicks==3){   
        if(door[0].pressed()) {
          door[0].getObject().setImage(door[0].getObject().getTImage());
          numclicks++;
         }
        if(door[1].pressed()) {
          numclicks++;
        door[1].getObject().setImage(door[1].getObject().getTImage());
         }
        if(door[2].pressed()) {
          numclicks++;
          door[2].getObject().setImage(door[2].getObject().getTImage());
        }
        if(door[3].pressed()) {
          numclicks++;
          door[3].getObject().setImage(door[3].getObject().getTImage());
        }
        if(door[4].pressed()) {
          numclicks++;
          door[4].getObject().setImage(door[4].getObject().getTImage());
        }
        if(door[5].pressed()) {
          numclicks++;
         door[5].getObject().setImage(door[5].getObject().getTImage());
        }
        if(door[6].pressed()) {
          numclicks++;
          door[6].getObject().setImage(door[6].getObject().getTImage());
        }
        if(door[7].pressed()) {
          numclicks++;
          door[7].getObject().setImage(door[7].getObject().getTImage());
        }
      }
      else{
        numclicks = 0;
        setup();
      }
      
    }
  }
  
  
  class buttons
  {
      int x, y;
      int size;
      boolean isOver = false;
      boolean isPressed = false;   
      Object currentimage;
      int innum = 0;
      int num = 0;
   
    void update() 
    {

      if(over()){
        currentimage.setImage(currentimage.getHImage());
        if(innum<1)
          num = 0;
      }
      else {
        //console.log("WHY ISN'T THIS WORKING?! ");
        currentimage.setImage(currentimage.getTempImage());
        if(num<3){
          //console.log(currentimage.getImage());
          num++;
        }
      }
        
    }
  
   boolean over() 

  {

    if( overRect(x, y, 100,200) ) {

      isOver = true;

      return true;

    } 

    else {

      isOver = false;

      return false;

    }
  }
  
    boolean pressed() 
    {
      if(isOver) {
        locked = true;
        return true;
      } 
      else {
        locked = false;
        return false;
      }    
    }
  
  
  
  
     
    boolean overRect(int a, int b, int width, int height) 
    {
      if (mouseX >= a && mouseX <= a+width && 
        mouseY >= b && mouseY <= b+height) {
        return true;
      } 
      else {
        return false;
      }
    }
  }
  
  class Doors extends buttons
  
  {
  
  
    Doors(int ix, int iy, Object b) 
    {
  
      currentimage = b;
      x = ix;
      y = iy;
    }
    
     
    
    
  
  
    void display() 
    {
     image(b.getImage(),x,y);
    }
    
    Object getObject(){
      return currentimage;
    }
  
  }
  
  class Object{
    PImage img;
    PImage himg;
    PImage timg;
    PImage tempimg;
    
    Object(int x, int w) {
      String v = w.toString() + "i.jpg";
      String y = x.toString() +".jpg";
      String z = x.toString() +"h.jpg";
      img = loadImage(y);
      tempimg = loadImage(y);
      himg = loadImage(z);
      timg = loadImage(v);
      }
    
    PImage getImage(){
      return img;
    }
    PImage getHImage(){
      return himg;
    }
    PImage getTImage(){
      console.log("getTimage:" + timg);
      return timg;
    }
    PImage getTempImage(){
      return tempimg;
    }
      
    void setImage(PImage ni){
      img = ni;
    }
  
  }


