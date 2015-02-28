
String[] sentences = {
  "This is sentence one that appears", "This is sentence two that appears", "This is sentence three that appears",
  "This is sentence four that appears", "This is sentence five that appears"
  
};

//declare indexes and result as global variable

int[] indexes = new int[sentences.length];
String result = "";

void setup() {  
  size(600, 400);
  background(0);
  fill(255);

  makeEssay() ;

}

void makeEssay() {

  result="";

  // define indexes
  for( int t=0; t<indexes.length; t++ ) {
    indexes[t]=t;
  }
  
  // shuffle
  for( int t=0; t<indexes.length; t++ ) {
    int r = int(random(indexes.length));
    int temp = indexes[r];
    indexes[r] = indexes[t];
    indexes[t] = temp;
  }
  
  // build essay
  for( int i=0; i<sentences.length; i++ ) {
     result = result + " " + sentences[indexes[i]] + ".";
    // String[] myWords = split(sentences[indexes[i]], " ");
  }
}

void draw() {
  background(0);
  result=result.trim();
  text(result, 25, 20, 260,190);
  // noLoop();
}

void keyPressed() {
makeEssay() ;
}

void mousePressed() {
makeEssay() ;
}

