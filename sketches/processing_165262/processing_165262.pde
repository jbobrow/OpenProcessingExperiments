
PFont f;                          //  Declare PFont variable
String[] words = { "love","amour","noir", "hurt","triste","heureux", "incroyable", "accident", "chat","plat", "chair", "cry","cinnamon", "shit", "glass", "crash", };

int index = int(random(words.length));  



void setup() {
  size(800,800);
  f = createFont("Arial",30,true); // Create Font
  
  

 
}

void draw() {
  background(51);
  
  textFont(f,60);                 //  Specify font to be used
  fill(255, 204, 0);                        // Specify font color 
  int index = int(random(words.length)); 
  textAlign(CENTER);
  text(words[index],width/2,height/2);  //  Display Text
  
  





  println(words[index]);




  noLoop();
  
  
}

  




void keyPressed(){
  
  

    
   
    if (key == 'l'){
       println("positive+4");
       loop();
    }
    
    else if (key == 'k'){
       println("positive+3");
       loop();
    }
     else if (key == 'j'){
       println("positive+2");
       loop();
    }
     else if (key == 'h'){
       println("positive+1");
       loop();
    }
     
     else if (key== 'g'){
       println("neutral");
       loop();
     }
     
    else if (key== 'f'){
       println("negative-1");
       loop();
     }
    
     else if (key== 'd'){
       println("negative-2");
       loop();
     }
     
      else if (key== 's'){
       println("negative-3");
       loop();
     }
     
     else if (key== 'a'){
       println("negative-4");
       loop();
     }
     
}


  
/*Class results{
  //Global variabes
  float x = 0;
  float y= 0;
  
  
  
  
  //Constructor - how do you build the class
  results(){
  
  }
  
  // functions
  
  void display(){
    ellipse(200,200,20,20);
  
  
  
}
 */


