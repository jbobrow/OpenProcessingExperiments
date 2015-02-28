
Maxim maxim;
PImage img;
//AudioPlayer player;
//AudioPlayer player2;

boolean estrellado = false; 
boolean empezo = false;
int contador = 0 ;
ParticleSystem ps;

boolean gano = false; 

void setup(){
  
    background(0);
    //maxim = new Maxim(this);
    //player = maxim.loadFile("hola.wav");
    //player2 = maxim.loadFile("game_over.wav");
    //player2.setLooping(false);
    //player.setLooping(true);
    ps = new ParticleSystem(new PVector(width/2,50));
  
    size(500,500);
    
    empezo = false;
    
    /*backgound also cleans the screens, if we change this to this funtion then everyime we are going to delete the data when we move the mouse accross the screen */
    background(255);
    
    create_laberito();

}

void draw(){
      
      if (empezo == false && (mousePressed)) 
      {
         if ((mouseX < 20 ) && (mouseY < 20))
           {
              empezo = true ;   
              //player.play();
              if (estrellado)
              {
                                                   
                    estrellado = false;  
                    setup();
               }
              
                           
           }   
                           
      }   
      else if (empezo == true && mousePressed){
        
        if ((mouseX > 480) && (mouseY > 480))
           {
              gano = true; 
           }
          
       
      }
      
  
      if (gano)
      {
        game_winner();
        
        //After winning the match if the player wants to reset the value he can put the mouse in the corner position in order to reset the game. 
        
        if (mouseX< 20 && mouseY < 20) 
        {
           
           gano = false;
           setup();
           
        }
        
      }
      
      
      if (mousePressed && empezo==true )
      {
          float red = map(mouseX,0, width, 0, 100);
          //map is like a scale of values, it will take the position in X and will scale it from 0 to 255  
                 
          float blue = map(mouseY,0, width, 0,100);
          
          float green = dist(mouseX, mouseY, width/2, height/2);
          
          float speed = dist (pmouseX, pmouseY, mouseX, mouseY);
                    
          float linewidth = map(speed, 0,10,10,1);
          linewidth = constrain (linewidth, 0, 10);
          
          
          noStroke();
                  
           fill(blue,green,red);
           ellipse(mouseX, mouseY, speed, speed);
          
           check_line();
                
      }
          

}



void mouseReleased() {
  
  //player.stop();
  
  if (mouseX > 480 && mouseY > 480) 
  {
    //here we don't do anything because is when the user wins the game 
  }
  else 
  {
    if (estrellado ==  false)
    {
       reset();
    }  
  }
}


// This is the event that handles the crash of the vehicle 

void show_crash(){
  //player.stop();
  //' we manipulate the speed of the playing of the sound to modify the original sound quality
  //player2.speed(1.3);
  //player2.play();
   contador = 0;
   reset();
   img = loadImage("crash.jpg");
  image(img,0,20,500, 480);
  estrellado = true; 
}


void reset(){
 background(255);
    create_laberito();
    empezo = false; 
   
}

//this method will create the laberithm 
 void create_laberito()
 {
   //horizontal lines 
   stroke(0);
   fill(0,0,0);
   line(0,0,0,500);
   line(0,500,500,500);
   line(500,500,500,0);
   line(0,0,500,0);
   line(0,20,60,20);
   line(80,20,200,20);
   line(240,20,260,20);
   line(280,20,480,20);
   line (20,40,200,40);
   line(140,240,220,240);
   line(120,260,240,260);
   line(20,400,120,400);
   line(40,420,100,420);
   line(20,440,80,440);
   line(40,460,100,460);
   line(20,480,100,480);
   line(140,280,460,280);
   line(300,40,500,40);
   line(280,60,480,60);
   line(300,80,500,80);
   line(280,100,480,100);
   line(300,120,500,120);
   line(280,140,480,140);
   line(300,160,440,160);
   line(300,180,420,180);
   line(320,200,440,200);
   line(300,220,420,220);
   line(320,240,440,240);
   line(300,260,480,260);
   line(300,300,480,300);
   line(280,320,460,320);
   line(300,340,480,340);
   line(280,360,460,360);
   line(300,380,480,380);
   line(280,400,460,400);
   line(300,420,480,420);
   line(280,440,460,440);
   line(300,460,480,460);
   line(300,480,500,480);
   line(40,60,200,60);
   
   //vertical lines
   
   line(20,40,20,480);
   line(40,60,40,380);
   line(60,80,60,400);
   line(80,60,80,380);
   line(100,80,100,460);
   line(120,60,120,500);
   line(120,60,120,500);
   line(140,80,140,240);
   line(140,280,140,480);
   line(160,60,160,220);
   line(160,300,160,500);
   line(180,80,180,240);
   line(180,280,180,480);
   line(200,60,200,220);
   line(200,300,200,500);
   line(220,0,220,240);
   line(220,280,220,480);
   line(240,20,240,260);
   line(240,300,240,500);
   line(240,20,240,260);
   line(240,300,240,500);
   line(260,20,260,260);
   line(240,300,240,500);
   line(260,20,260,260);
   line(260,280,260,480);
   line(280,20,280,500);
   line(300,160,300,260);
   line(460,140,460,240);
   line(440,160,440,240);
   line(480,160,480,480);
        
   fill(0,100,0);
   rect(0,0,20,20);
   rect(480,480,500,500);
   
  noStroke();
        
 }
 
 void check_line()
 {
   float x = mouseX;
   float y = mouseY;
   //println( x + "-" + y );
       
   if (x < 60 && y == 20) 
    {
       
       show_crash();
    }
    
   if ((x>80 && x < 200 ) && y == 20)
   {
        show_crash();
   }
   
   if (x>20 && x < 200 && y == 40)
   {
         show_crash();
   }
   if (x>40 && x < 200 && y ==60 )
   {
        show_crash();
     
   }
   
   if (x> 20 && x < 120  && y == 400)
   {
         show_crash();
   }
   if (x> 40 && x < 100 && y == 420 )
   {
         show_crash();
   }
   if (x> 20 && x <  80 && y == 440 )
   {
        show_crash();
   }
   if (x> 40 && x < 100 && y == 460)
   {
         show_crash();
   }
   if (x> 20 && x < 100 && y == 480 )
   {
         show_crash();
   }
   if (x> 120 && x < 240 && y == 260 )
   {
         show_crash();
   }
   if (x>  240 && x < 260 && y == 20)
   {
         show_crash();
   }
   if (x> 140 && x < 460 && y == 280 )
   {
         show_crash();
   }
   if (x> 280 && x < 480 && y == 20)
   {
         show_crash();
   }
   if (x> 300 && x <  500 && y == 40)
   {
         show_crash();
   }
   if (x> 280 && x < 480 && y ==  60)
   {
         show_crash();
   }
   if (x> 300 && x < 500  && y == 80)
   {
         show_crash();
   }
   
    if (x> 280 && x < 480  && y == 100)
   {
         show_crash();
   }
   
    if (x> 300 && x < 500  && y == 120)
   {
         show_crash();
   }
    if (x> 280  && x < 480  && y == 140 )
   {
         show_crash();
   }
    if (x> 300 && x < 440  && y == 160)
   {
         show_crash();
   }
    if (x> 300 && x < 420  && y == 180)
   {
        show_crash();
   }
    if (x> 320 && x < 440  && y == 200)
   {
         show_crash();
   }
    if (x> 300  && x < 420   && y == 220)
   {
         show_crash();
   }
    if (x> 320  && x <  440 && y == 240 )
   {
         show_crash();
   }
    if (x> 300 && x < 480  && y == 260)
   {
         show_crash();
   }
    if (x>  300 && x < 480  && y == 300)
   {
         show_crash();
   }
    if (x> 280  && x < 460  && y == 320)
   {
         show_crash();
   }
    if (x> 300 && x <  480 && y == 340)
   {
         show_crash();
   }
    if (x> 280 && x < 460  && y == 360)
   {
         show_crash();
   }
    if (x> 300 && x < 460  && y == 380)
   {
         show_crash();
   }
   
      if (x> 280 && x <  460 && y == 400)
   {
         show_crash();
   }
   
      if (x> 300 && x < 480  && y == 420)
   {
         show_crash();
   }
   
      if (x> 280 && x <  460 && y == 440)
   {
         show_crash();
   }
   
      if (x> 300 && x < 480  && y == 460 )
   {
         show_crash();
   }
   
      if (x> 300 && x <  500 && y == 480)
   {
         show_crash();
   }
   
   if( y> 40 && y < 480 && x == 20)
   {
         show_crash();
   }
   
   if( y> 60 && y < 380 && x == 60 )
   {
         show_crash();
   }
   
   if( y> 80 && y < 400 && x == 60)
   {
         show_crash();
   }
   
   if( y> 60 && y < 380 && x == 80)
   {
         show_crash();
   }
   
   if( y> 80 && y < 460 && x == 100)
   {
         show_crash();
   }
   
   if( y> 60 && y < 500 && x == 120)
   {
         show_crash();
   }
   
   if( y> 80 && y < 240 && x == 140)
   {
         show_crash();
   }
   
   if( y> 280 && y < 480 && x == 140)
   {
         show_crash();
   }
   
   if( y> 60 && y < 220 && x == 160)
   {
         show_crash();
   }
   
   if( y> 300 && y < 500 && x == 160)
   {
         show_crash();
   }
   
   if( y> 80 && y < 240 && x == 180)
   {
         show_crash();
   }
   
   if( y> 280 && y < 480 && x == 180)
   {
         show_crash();
   }
   
   if( y>60 && y < 220 && x == 200)
   {
         show_crash();
   }
   
   if( y> 300 && y < 500 && x == 200)
   {
         show_crash();
   }
   
   if (( y> 0 && y < 40) && (x ==220 || x==219 || x==221))
   {
         show_crash();
   }
      if (( y> 40 && y < 240) && (x ==220 ))
   {
         show_crash();
   }
   
   if( y> 280 && y < 480 && x == 220)
   {
         show_crash();
   }
     if( y> 20 && y < 260 && x == 240)
   {
         show_crash();
   }
     if( y> 300 && y < 500 && x ==  240)
   {
        show_crash();
   }
     if( y> 20 && y < 260 && x == 260 )
   {
         show_crash();
   }
     if( y>  280 &&y < 480 && x ==  260)
   {
         show_crash();
   }
     if( y> 20 && y < 500 && x == 280 )
   {
         show_crash();
   }
   
   if( y> 160 && y < 260 && x == 300 )
   {
        show_crash();
   }
   
        if( y> 160 && y < 260 && x == 440)
   {
        show_crash();
   }
   
          if( y> 140 && y < 240 && x == 460)
   {
         show_crash();
   }
   
        if( y> 160 && y < 480 && x == 480 )
   {
         show_crash();
   }
   
     
 }
 
 
void game_winner() {
   
  background(0);
  
  PFont font;
 
  fill(0,100,0);
  textSize(32);
  text("YOU WON THE GAME", 100,100);
  rect(0,0,20,20);
  ps.addParticle();
  ps.run();
}


// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color c;
  float size;

  Particle(PVector l) {
    acceleration = new PVector(0,-0.01);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
    c = color(random(255),random(255),random(255));
    size = 20;
    
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255);
    fill(c);
    ellipse(location.x,location.y,size,size+20);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



 // A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    location.set(255,500,0);
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

 



