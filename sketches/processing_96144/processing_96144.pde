
int screenX = 800;
int screenY = 800;

boolean square_state = false;

color square_color_off = color(128,128,128);
color square_color_on = color(222,23,67);
int random_match_color_int=0  ;

int active_color_square = 1;
color active_color;

color match_circle_color;


int match_r,match_g,match_b;
color check_color = color(match_r,match_g,match_b);

int r2,g2,b2;

boolean operation_state = true;

boolean guess_check = false;

color color_a;
color color_b;
color color_c = color(0,0,0);

void setup()

{
  
  size(800,800); //sets screen size
  


  
  
  
}


void draw()

{
  
  
  smooth();
  background(150); 
  
  if(square_state){ //if square state is true
  
  fill(active_color);//fill square with active color
  
  }
  
  else{ //if square state is false
    
    fill(square_color_off); //fill square with off 'color'
    
  }
  

  //add operation buttons
  
  rectMode(CENTER);
  
  strokeWeight(2);
  
  
  //draws the addition button
  if(operation_state){
  fill(125,203,181);}
  
  else{fill(255);};
  rect(50,380,70,50);
  fill(0);
  rect(50,380,40,10);
  rect(50,380,10,40);
  
  //draws the subtraction button
  
  if(!operation_state){
    fill(125,203,181);}
    
  else{fill(255);}
  

  rect(50,440,70,50);
  fill(0);
  rect(50,440,40,10);
  
  
  //draw match circle 
  
  textAlign(LEFT);
  
  textSize(20);
  text("Practice Your Additive Color Theory Mixing Skills", 165,100); 
  
  textSize(50);
  text("Match Color: ", 230,200); 
  textSize(20);
  text("Press SPACE for new Color",280,240);
  
  textSize(10);
  text("work-area",370,470);
  
  ellipseMode(CENTER);
  


  //println(r);
  //println(g);
  //println(b);
  
  fill(match_r,match_g,match_b);
  ellipse(570,190,40,40);
  
  //draw color pallete
  
  int pallet_square_size = 50;
  int pallet_square_spacing = 100;
  int active_stroke_weight = 5;
  
  fill(255);
  if(active_color_square ==1){
    
  color_b = color(255,255,255);
  strokeWeight(active_stroke_weight);
  active_color = color(255,255,255);}
  else{strokeWeight(1);}
  rect(pallet_square_spacing,750,pallet_square_size,pallet_square_size);
  
  stroke(255,0,0);
  line(pallet_square_spacing - (pallet_square_size/2)+5,770, pallet_square_spacing + pallet_square_size/2 - 5, 730);
  stroke(0);
  

  fill(255,0,0);
  if(active_color_square ==2){
  color_b = color(255,0,0);
  strokeWeight(active_stroke_weight);}
  else{strokeWeight(1);} 
  rect(pallet_square_spacing*2, 750,pallet_square_size,pallet_square_size);
  
  fill(0,255,0);
  if(active_color_square ==3){
  color_b = color(0,255,0);
  strokeWeight(active_stroke_weight);}
  else{strokeWeight(1);} 
  rect(pallet_square_spacing*3,750,pallet_square_size,pallet_square_size);
  
  fill(0,0,255);
  if(active_color_square ==4){
  color_b = color(0,0,255);
  strokeWeight(active_stroke_weight);}
  else{strokeWeight(1);} 
  rect(pallet_square_spacing*4,750,pallet_square_size,pallet_square_size);

  //fill(0,255,255);
 // if(active_color_square ==5){
  //color_b = color(0,255,255);
 // strokeWeight(active_stroke_weight);}
  //else{strokeWeight(1);} 
 // rect(pallet_square_spacing*5, 750,pallet_square_size,pallet_square_size);
  
 // fill(255,0,255);
 // if(active_color_square ==6){
 // color_b = color(255,0,255);
 // strokeWeight(active_stroke_weight);}
 // else{strokeWeight(1);} 
 // rect(pallet_square_spacing*6,750,pallet_square_size,pallet_square_size);
  
 // fill(255,255,0);
//  if(active_color_square ==7){
 // color_b = color(255,255,0);
 // strokeWeight(active_stroke_weight);}
 // else{strokeWeight(1);} 
 // rect(pallet_square_spacing*7,750,pallet_square_size,pallet_square_size);
  
   
   
   
  rectMode(CENTER);
  strokeWeight(2);
  fill(color_c);
  rect(screenX/2,screenY/2,100,100); //draws square in center of screen
    
}


void keyPressed(){
  
      
      if(keyCode == UP && !operation_state){
      
        operation_state = true;
        println("up key pressed");
      
      }
      
        if(keyCode == DOWN && operation_state){
      
        operation_state = false;
        println("down key pressed");
      
      }
      
      if(keyCode == RIGHT  && active_color_square < 4){
        
        active_color_square  = active_color_square + 1;
        
        //println("active_color_square = " + active_color_square);
        
      }
      
        if(keyCode == LEFT  && active_color_square > 1){
        
        active_color_square  = active_color_square - 1;
        
        //println("active_color_square = " + active_color_square);
        
      }
      
      
      if(keyCode == ENTER && operation_state && active_color_square > 1){ //if enter is pressed while addition is selected 
      
      color_a = color_c;
      color_c = color_a + color_b;     
      }
      
      
      
      if(keyCode == ENTER && !operation_state && active_color_square > 1){ //if enter is pressed while addition is selected 
      
      color_a = color_c;
      color_c = color_a - color_b;     
      }
      
      if(keyCode == ENTER && active_color_square == 1){ //if enter is pressed while addition is selected 
      
      color_c = color(0,0,0);
      
      }
      
      

        
      if(key == ' '){ //if SPACE bar is pressed
       
          float random_match_color_float = random(1,6);
          int random_match_color_int = round(random_match_color_float);
          //println(random_match_color_int); 
          
          
              if(random_match_color_int == 1){
              match_r=255;match_g=0;match_b=0;}
              
              else if(random_match_color_int == 2){
              match_r=0;match_g=255;match_b=0;}
              
              else if(random_match_color_int == 3){
              match_r=0;match_g=0;match_b=255;}
             
              else if(random_match_color_int == 4){
              match_r=255;match_g=255;match_b=0;}
              
              else if(random_match_color_int == 5){
              match_r=0;match_g=255;match_b=255;}
            
              else if(random_match_color_int == 6){
              match_r=255;match_g=0;match_b=255;}
            
              else{match_r=0;match_g=0;match_b=0;} 
  
      check_color = color(match_r,match_g,match_b);

          
      }
      
    

 
 
 
 
   

    

  
}



void mouseClicked()

{
  
  if (mouseX < 450 && mouseX > 350 && mouseY <450 && mouseY>350){ //checks to see if the square has been clicked on 
    
    //println("you clicked on the square"); //boundary detection is true
    
    if(!square_state){ //if the square's selection state is false then..
      
      square_state = true; //make it true
      
    }
    
    else if(square_state){ //if the square's selection state is true then..
      
      square_state = false;//make it false
      
    }
    
    //println("square state is: " + square_state); //prints the square's current state
  
  }
  
    
}





