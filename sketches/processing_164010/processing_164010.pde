
void setup() {
}

void draw() {
  char myGrade = letterGrade(90.789);
  println(complimentGenerator(myGrade));
  noLoop();
}

char letterGrade(int percentage) {
  if (percentage > 89.5) {
    return 'A';
  } else if (percentage >=79.5) {
    return 'B';
  } else if (percentage >=69.5) {
    return 'C';
  } else if (percentage >=59.5) {
    return 'D';
  } else {
    return 'F';
  }
}

String complimentGenerator(char letterGrade){
  if(letterGrade == 'A'){
    return "you think you're something?";
  }else if(letterGrade == 'B'){
    return "k";
  }else if(letterGrade == 'C'){
    return "pick it up big dog";
  }else if(letterGrade == 'D'){
   return "you're like Kanye in Good Morning";
  } else{
  return "damnnnnnnnnn";
  }

