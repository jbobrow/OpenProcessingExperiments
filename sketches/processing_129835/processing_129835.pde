
int y = 0;
int x = 0;
float ted = random(200);
float joe = random(200);
int s = 200;
int w = 0;
int k = 50;
ArrayList<Integer> wins;
void setup(){
  size(1000,1000);
  background(0);
  wins = new ArrayList<Integer>();
  
}

void draw(){
  
  
  if ((x+500)>=(ted-s) && (x+500)<= (ted+s)){
    if ((y+500)>=(joe-s) && (y+500)<= (joe+s)){
      fill(255,0,0);
      ellipse(ted,joe,50,50);
    }
    else { 
      fill(0);
      ellipse(ted,joe,50,50);
    }
  }
    
  else{
  fill(0);
  ellipse(ted,joe,50,50);
  }
  if (y < -500){
    y = 500;
  }
  if (y > 500){
    y = -500;
  }
  if (x < -500){
    x = 500;
  }
  if (x > 500){
    x = -500;
  }
  fill(random(255),random(255),random(255));
  ellipse(500+x,500+y,s,s);
  
  
  if (mousePressed){
    if (mouseX >=(ted-40) && mouseX<= (ted+40)){
      if (mouseY>=(joe-40) && mouseY <= (joe+40)){
        if(wins.size() >=3){
          s = s - 10;
          wins.add(1);
          ted  = random(1000);
          joe = random(1000);
          println("level");
          println(wins.size());
          background(0);
          
          if (wins.size() == 8){
            s = 200;
            wins.add(1);
            println("You win");
            background(0);
          }
        }
        
        else{
        println("you Win");
        s = s-50;
        ted  = random(1000);
        joe = random(1000);
        wins.add(1);
        println("level");
        println(wins.size());
        background(0);
        }
      }
    }
  }
      
  
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) { 
      y = y - k;
    }
    if (keyCode == DOWN) { 
      y = y + k;
    }
    if (keyCode == RIGHT) { 
      x = x + k;
    }
    if (keyCode == LEFT) { 
      x = x - k;
    }
  }
}


  
  
