

String[] adjectives;
String[] iLike;
String[] data;
int adjCount;
int likeCount;
String Compliment = "Jessica, ";
void setup()
{
  size(800,600);
  adjectives = loadStrings("adjectives.txt");
  iLike = loadStrings("thingsILike.txt");
  adjCount =adjectives.length;
  likeCount = iLike.length;
  
}

void draw()
{
  
  background(0);
  fill(255,255,255);
  rect(0,0,800,60);
  fill(255,0,0);
  ellipse(width/2, height/2, 400,400);
  fill(255,255,255);
  textSize(50);
  text("Compliment Me \n       John!",210,300);
  
  if(mousePressed)
  {
    float contact = dist(mouseX,mouseY,400,400);
    if(contact < 200)
    {
     Compliment ="Jessica, ";
     Compliment += GenerateCompliment();
     
     
    }
  }
  
  fill(0,0,0);
  textSize(24);
  text(Compliment ,10,50);
}



String GenerateCompliment()
{
  int phrase1 =int(random(0,50));
  int randAdj =int(random(0,adjCount));
  int randLike =int(random(0,likeCount));
  String finalComp="";
  if(phrase1 == 0)
  {
    finalComp = "I love you :*";
  }
  else if(phrase1 == 1)
  {
    finalComp = "you're nicer than a day on the beach.";
    
  }
  else if(phrase1 == 2)
  {
    finalComp = "I love you more than bacon!";
  }
  else if(phrase1 == 3)
  {
    finalComp = "If we were playing kickball, I'd pick you first.";
  }
  else if(phrase1 == 4)
  {
    finalComp = "You are the sugar on my rice krispies.";
  }
  else if(phrase1 == 5)
  {
    finalComp = "You are the star of my daydreams.";
    
  }
  else if(phrase1 == 6)
  {
    finalComp = "you could probably lead a rebellion.";
    
  }
  else if(phrase1 == 7)
  {
    finalComp = "I told all my friends about how cool you are.";
    
  }
  else if(phrase1 == 8)
  {
    finalComp = "your mind is a maze of amazing!";
    
  }
  else if(phrase1 == 9)
  {
    finalComp = "they should name an ice cream flavor after you.";
    
  }
  else
  {
  
    finalComp ="you have the most ";
    finalComp+= adjectives[randAdj];
    finalComp += " ";
    finalComp += iLike[randLike];
  }
  
  return finalComp;
  
}
