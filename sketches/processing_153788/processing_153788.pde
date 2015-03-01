
/*
 * typingSkill
 * created by @nomadiccreature (/twitter)
 * Practice your typing skill
 * Exploring processing #Sketch3
 *
 */
float i;
int score=0;

void setup(){
  size(600,600);
  i= random(0,25);
  background(0);
  textSize(30); 
  text("Practice your typing skills.", 100, 100, 500, 500); 
  text("Start by pressing any key.", 100, 300, 500, 500);
}

void draw(){  
 if (keyPressed){ 
   randomAlphabets(); 
 }
}

//new alphabet function
void randomAlphabets(){  
  background(0);
  String[] alphabets= {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
  String single = alphabets[int(i)];
  char c = single.charAt(0); 
  textSize(20);  
  text(single, 350, 290, 300, 300);
  String Score = "Score: " + score;
  text(Score, 100, 100, 300, 300);
  if (key == c) {       
      i=random(0,25);
      score++; //updates your score
    }
}
