
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
//poem by John Masefield
print (" Have seen dawn and sunset on moors and windy hills ,");
print (" Coming in solemn beauty like slow old tunes of Spain:,");
print (" I have seen the lady April bringing in the daffodils,");
print (" Bringing the springing grass and the soft warm April rain.,");


print (" I have heard the song of the blossoms and the old chant"); print ("  of the sea,");
print (" And seen strange lands from under the arched white sails"); print ("  of ships,"); 
print (" But the loveliest things of beauty God ever has showed");  print ("  me,");
print (" Are her voice, and her hair, and eyes, and the dear red"); print ("  curve of her lips.,");   
     
                
                                                                                                                                                                                                                                                                                                
