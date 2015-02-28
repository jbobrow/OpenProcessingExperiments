
//all of the particles and springs
ArrayList<particle> particles=new ArrayList<particle>();
ArrayList<spring> springs=new ArrayList<spring>();

//keep track of current nodes
particle letter;
particle word;
particle sentence;
particle base;

//distances
float scaleVal=0.75;  //how much I'm scaling down form OF original
float letterDist=70*scaleVal;   //space from word node to letter
float wordDist=140*scaleVal;     //space from sentence node to word node
float sentenceDist=210*scaleVal; //space from base node to sentence node

boolean newSentence=false;
boolean wordHasLetters=false;

PFont font;


void setup() {
  smooth();
  size(700, 700);

  font=loadFont("AndaleMono-48.vlw");
  textFont(font,25);
  particle myParticle;

  //base node
  myParticle=new particle();
  myParticle.setInitialCondition(width/2, height/2, 0, 0);
  myParticle.bFixed=true;
  particles.add(myParticle);
  base=myParticle;

  //starting sentence
  myParticle=new particle();
  myParticle.setInitialCondition(random(width), random(height), 0, 0);
  particles.add(myParticle);
  sentence=myParticle;
  addSpring(sentenceDist, 0.2, base, sentence);

  //starting word
  myParticle=new particle();
  myParticle.setInitialCondition(random(width), random(height), 0, 0);
  particles.add(myParticle);
  word=myParticle;
  addSpring(wordDist, 0.2, sentence, word);

  letter=word;
}


void draw() {
  background(0);

  //place everything
  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).resetForce();
  }

  for (int i = 0; i < particles.size(); i++) {

    particles.get(i).addRepulsionForce(mouseX, mouseY, 200, 0.7f);

    for (int j = 0; j < i; j++) {
      particles.get(i).addRepulsionForce(particles.get(j), wordDist, 0.3);
    }
  }

  for (int i = 0; i < springs.size(); i++) {
    springs.get(i).update();
  }


  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).addDampingForce();
    particles.get(i).update();
  }


  //draw everything
  fill(255);
  stroke(255);

  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).draw();
  }

  stroke(255, 100);
  for (int i = 0; i < springs.size(); i++) {
    springs.get(i).draw();
  }
}

void keyPressed() {
  //some keys like shift and arrows should be ignored
  if (keyCode==16 || keyCode==37 || keyCode==38 || keyCode==39 || keyCode==40 || keyCode==157 || keyCode==18 || keyCode==17)
    return;
  
  if (key=='?' || key=='!' || key=='.' || keyCode==10){
        //set the current sentence to have that punctuation
        sentence.letter=key;
        newSentence=true;
        return; //get out of the key presses loop and wait for the next key
    }
    if (newSentence){
        //start a new sentence on punctuation or enter
        particle myParticle;
        myParticle=new particle();
        myParticle.setInitialCondition(base.pos.x+random(-sentenceDist,sentenceDist),base.pos.y+random(-sentenceDist,sentenceDist),0,0);
        particles.add(myParticle);
        sentence=myParticle;
        addSpring(sentenceDist, 0.2, base, sentence);
        
        //add a new word
        myParticle=new particle();
        myParticle.setInitialCondition(sentence.pos.x+random(-wordDist,wordDist),sentence.pos.y+random(-wordDist,wordDist),0,0);
        particles.add(myParticle);
        word=myParticle;
        addSpring(wordDist, 0.2, word, sentence);
        newSentence=false;
        wordHasLetters=false;
    }
    //a new sentence will also require a new word
    if (key==' '){
        //add a new word
        if (wordHasLetters){
            particle myParticle;
            myParticle=new particle();
            myParticle.setInitialCondition(sentence.pos.x+random(-wordDist,wordDist),sentence.pos.y+random(-wordDist,wordDist),0,0);
            particles.add(myParticle);
            word=myParticle;
            addSpring(wordDist, 0.2, word, sentence);
            wordHasLetters=false;
        }
    }
    else{
        // for any other character, add a new letter particle
        //set it to be just clockwise to the last letter
        float angle=atan2(letter.pos.y-word.pos.y,letter.pos.x-word.pos.x)+PI/20;
        particle myParticle;
        myParticle=new particle();
        myParticle.setInitialCondition(word.pos.x+cos(angle)*letterDist,word.pos.y+sin(angle)*letterDist,0,0);
        myParticle.letter=key;
        particles.add(myParticle);
        addSpring(letterDist, 0.2, word, myParticle);
        letter=myParticle;
        wordHasLetters=true;
    }
}

void addSpring(float dist, float springiness, particle a, particle b){
    spring mySpring = new spring();
    mySpring.distance		= dist;
    mySpring.springiness	= springiness;
    mySpring.particleA = a;
    mySpring.particleB = b;
    springs.add(mySpring);

}


