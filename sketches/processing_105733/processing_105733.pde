
float unit_width;
float unit_height;
char [] eng_character = new char [27]; 
int selected_character;
int r,g,b;
float txt_size;
int capital = 65;
int low = 97;
boolean caps = false;

void setup(){
  background(0);
  if(frame != null)
    frame.setResizable(true);
  frameRate(10);
  smooth();
  size(600,600);
  txt_size = 27;
  constrain(txt_size, 1, 100);
  
  for(int i = 0; i < eng_character.length; i++)
     eng_character[i] = (char)(low+i); 
  
}

void draw(){
  background(0);
  unit_width = textAscent() * 0.60;
  unit_height = textAscent() * 0.60;
  
  r = (int)random(255);
  g = (int)random(255);
  b = (int)random(255);
  
  noStroke();
  textSize(txt_size);


  
  if(!keyPressed || !mousePressed){              //// Nothing Pressed
    for(int i=0; i < height/unit_height; i++)
        for(int j=0; j < width/unit_width; j++){
           selected_character = int(random(27));
           draw_pattern(j,i);
        }
  }
  
  if(keyPressed){                               //// Key Pressed
      if(key == CODED) {                           
        if(keyCode == UP) {                              ///UP Key
          for(int i = 0; i < eng_character.length; i++){
             eng_character[i] = (char)(capital+i); 
          }
          caps = true;
        }else if(keyCode == DOWN){                       ///DOWN Key
          for(int i = 0; i < eng_character.length; i++){
             eng_character[i] = (char)(low+i); 
          }
          caps = false;
        }
    }else if(key !=CODED && !mousePressed){             ///Alpabet Key
        background(0);
        for(int i=0; i < height/unit_height; i++)
          for(int j=0; j < width/unit_width; j++){
            if(caps && key == CODED){
              selected_character = (int)key-capital;
            }else{
              selected_character = (int)key-low;
            }
            println((int)key);
             draw_pattern(j,i);
        }
    }else if(key !=CODED && mousePressed){             /// Alpabet Key and Mouse Pressed
      noLoop();
      background(0);
      for(int i=0; i < height/unit_height; i++)
        for(int j=0; j < width/unit_width; j++){
          if(caps && key == CODED){
            selected_character = (int)key-capital;
          }else{
            selected_character = (int)key-low;
          }
          println((int)key);
           draw_pattern(j,i);
      }
    }
  }else if(mousePressed && !keyPressed){      //// Only Mouse Pressed
    if(mouseButton == LEFT){                    // left click
      noLoop();      
      background(0);
      textSize(txt_size * 1.1);
      for(int i=0; i < height/unit_height; i++)
        for(int j=0; j < width/unit_width; j++){
          selected_character = int(random(27));
           draw_pattern(j,i);
      }
    }else if(mouseButton == RIGHT){                // right click
     background(0);
     noLoop();
      r=255;
      g=255;
      b=255;
      textSize(txt_size * 1.1);
      for(int i=0; i < height/unit_height; i++)
        for(int j=0; j < width/unit_width; j++){
          selected_character = int(random(27));
           draw_pattern(j,i);
      }
    }
  }else
     keyReleased();                            ///// Key released
}


void mouseReleased(){                         ///// Mouse released
  loop();
}
 
void mouseWheel(MouseEvent event){   //// Mouse Wheel adjusts the size of texts
  float e = event.getAmount();
  txt_size += e;
  textSize(txt_size);
}


void draw_pattern(int x, int y){     /// text pattern Drawing Function 
  fill(r,g,b);
  text(eng_character[selected_character],x*unit_width, y*unit_height+15);
}


