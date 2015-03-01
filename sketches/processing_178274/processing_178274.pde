
// use "t" to toggle between pundit and chaitanya


//Loads all the images here
PImage pastor,pandit,nextBtn,prevBtn,boy,ganesha,jesus,rama,hanuman,mary,shakti,cross,linga;
String preacher;
int symbolIndex;
String[] pastorOpinions,panditOpinions;
PImage[] figures;

//Sets up the canvas

void setup(){
  //set size and background color of canvas
  size(800,600);
  background(#ffffff);
  // assign images
  pastor = loadImage("pastor.png");
  pandit = loadImage("chaitanya.png");
  nextBtn = loadImage("next.png");
  prevBtn = loadImage("previous.png");
  boy = loadImage("safari_kid.png");
  ganesha = loadImage("ganesh.png");
  jesus = loadImage("jesus.jpg");
  rama = loadImage("rama.jpg");
  hanuman =loadImage("hanuman.jpg");
  mary = loadImage("mary.jpg");
  shakti = loadImage("shakti.jpg");
  cross = loadImage("cross.jpg");
  linga = loadImage("linga.jpg");
  
  //global variables 
  preacher = "Pastor";
  symbolIndex = 0;
  pastorOpinions = new String[8];
  panditOpinions = new String[8];
  figures = new PImage[8];
  
  figures[0] = ganesha;
  pastorOpinions[0] = "It is a grotesque object. It has an elephant head and human body. Surely worshipped by Pagans. You will go to hell if you worship it";
  panditOpinions[0] = "Lord Ganesha represents God's characteristics of infinite knowledge. Concentrate on Ganesha's obedience, dedication and other qualities";


  figures[1] = jesus;  
  pastorOpinions[1] = "He is the Son of God. Since he is one of the trinity, it is equal to worshipping God if you worship Jesus";
  panditOpinions[1] = "A peaceful Saint. But not God. You can concentrate on him to work on non violence. Be careful, Christians don't accept other faiths.";
  
  figures[2] = rama;
  pastorOpinions[2] = "He is just a mythological hero. Not a true God";
  panditOpinions[2] = "Rama symbolizes idealistic aspects of God. Concentrate on God's qualities of duty, obedience, respect by concentrating on Rama.";
  
  figures[3] = shakti;
  pastorOpinions[3] = "This proves that idolators worship female Gods also. If you follow false Gods you are sure to go to hell.";
  panditOpinions[3] = "Shakti represents the feminine aspects of God. Concentrate on God's qualities of motherly love, energy by meditating on Shakti.";
  
  figures[4] = mary;
  pastorOpinions[4] = "She is the holy Virgin. Respect her like a saint";
  panditOpinions[4] = "She represents pure nature of God, you may worship those aspects but beware, the Christian followers don't tolerate other forms of worship once you convert!";
  
  figures[5] = hanuman;
  pastorOpinions[5] = "Look at these Pagans. Now they are worshipping monkeys too!";
  panditOpinions[5] = "Hanuman embodies devotion (Bhakti)and strength. Meditate on these qualities of God to make yourself strong.";
  
  figures[6] = cross;
  pastorOpinions[6] = "It symbolizes the sacrifice of Jesus for our sins. Embrace Jesus and purge your sins.";
  panditOpinions[6] = "IT is a symbol of Christianity. Christianity as such discourages any other forms of worship except Jesus. Once you convert there is no coming back !!";
  
  figures[7] = linga;
  pastorOpinions[7] = "Look!! These idiots are worshipping penis!";
  panditOpinions[7] = "Linga has more than one meaning. It is the symbol for Lord Shiva, the resetter of the Universe. It represents cyclic nature of Universe. Concentrate on the eternality of the Universe through Shiva Linga";

}

void draw(){
  background(#ffffff);
  redrawImages();
  displayPreacherOpinion();
  populateStudentDialog();
  

}

//lists all the keypress events
void keyPressed() {                
  if (key == 't' || key == 'T') { 
      togglePreacher();
  }  
  if (key == 'n' || key == 'N') { 
      nextFigure();
  } 
  if (key == 'p' || key == 'P') { 
      prevFigure();
  }  
}
//lists all mouse pressed events
void mousePressed() {
  if ((mouseX>=395)&&(mouseX<=545)&&(mouseY>=455)&&(mouseY<=510)) {
    togglePreacher();
  }
  if ((mouseX>=650)&&(mouseX<=682)&&(mouseY>=250)&&(mouseY<=282)) {
    prevFigure();
  }
  if ((mouseX>=700)&&(mouseX<=732)&&(mouseY>=250)&&(mouseY<=282)) {
        nextFigure();
  }  
}

//custom functions

// redraws images
void redrawImages(){
  if (preacher=="Pastor"){
   image(pastor,50,100);
  }
  else {
    image(pandit,50,150);
  }
  //draws figure image
  image(figures[symbolIndex],550,5);
  image(boy,650,300);
  image(prevBtn,650,250);
  image(nextBtn,700,250);
};

//toggles the  preachers (opinions)
void togglePreacher(){
  //toggle the image
  //toggle the text
  //set the preacher
  if (preacher=="Pastor"){
    preacher="Pandit";
  }
  else{
    preacher="Pastor";
  }
  
}

//populates student dialog
void populateStudentDialog(){
  fill(0, 102, 153);
  textSize(32);
  text("What is this figure?",395,450);
  String theOtherPreacher = otherPreacher();
  String askBtnTxt = "Ask "+theOtherPreacher;
  rect(395, 455, 150, 55, 7);
  stroke(#ffffff);
  textSize(25);
  fill(#ffffff);
  text(askBtnTxt,405,490);
};

// displays the preacher's opinion
void displayPreacherOpinion(){
  fill(50);

  String preacherText = getPreacherText();
  String headerText = preacher+"'s answer:";
  text(headerText, 300, 250);
  textSize(14);
  text(preacherText, 300, 255, 300, 400); 
}

//retrives the preacher text from global variables
 String getPreacherText(){
  if (preacher=="Pastor"){
    // get info from pastor table
    return pastorOpinions[symbolIndex];
  }
  if (preacher=="Pandit"){
    //get info from pandit table
    return panditOpinions[symbolIndex];
  }
   return "Hello MR Kool";
 }

 String otherPreacher(){
   if (preacher=="Pastor"){
     return "Pandit";
   }
   
   else{
     return "Pastor";
   }
 }

 void nextFigure(){
   if (symbolIndex==7){symbolIndex=0;}
   else{
   symbolIndex+=1;
     } 
 } 
 void prevFigure(){
   if (symbolIndex==0){symbolIndex=7;}
   else{
   symbolIndex-=1;
     } 
 }



