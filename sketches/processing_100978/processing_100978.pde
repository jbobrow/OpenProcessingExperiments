
int NUMBER_OF_NUMBERS=15;
int FRAME_RATE=5;
int[] numbers;
int current;
int position;
int frame;
int min;
void setup() {
  size(450,400);
  //size(NUMBER_OF_NUMBERS*30,100+NUMBER_OF_NUMBERS*20);
  frameRate(FRAME_RATE);
  current=0;
  position=0;
  frame=0;
  min=0;
  numbers=new int[NUMBER_OF_NUMBERS];
  for (int i = 0; i <NUMBER_OF_NUMBERS;i++) {
    int temp=(int)(Math.random()*NUMBER_OF_NUMBERS-.5);
    while (numbers[temp]!=0) {
      temp=(int)(Math.random()*NUMBER_OF_NUMBERS-.5);
    }
    numbers[temp]=i+1;
  }
}
void draw() {
  if (frame==1) {
    background(255, 0, 0);
    display();
    frame=11;
  }
  else if (frame==11) {
    background(0, 0, 255);
    display();
    min=current;
    current++;
    frame=0;
  }
  else if (frame>=12) {
    background(0);
    display();
    if (min!=position) {
      stroke(255, 0, 0);
      line(position*30+10, 20*NUMBER_OF_NUMBERS+100-10*numbers[position], min*30, 20*NUMBER_OF_NUMBERS+100-10*numbers[min]);
      stroke(0);
    }
    else {
      fill(255, 0, 0);
      text("No Swap Needed", 100, 50);
    }
    frame++;
    if (frame==20) {
      int temp = numbers[min];
      numbers[min] = numbers[position];
      numbers[position]=temp;
      frame++;
    }
    if (frame==25) {
      frame=0;
      position++;
      min=position;
      current=position+1;
    }
  }
  else if (frame==2||frame==4||frame==6||frame==8) {
    background(0, 255, 0);
    display();
    frame++;
  }
  else if (frame==3||frame==5||frame==7||frame==9) {
    background(0, 255, 0);
    display();
    frame++;
  }
  else if (frame==10) {
    setup();
  }
  else {
    background(0, 0, 255);
    display();
    if (numbers[min]>numbers[current]) {
      frame=1;
    }
    else {
      current++;
    }
  }
  if (current==NUMBER_OF_NUMBERS) {
    if (position==NUMBER_OF_NUMBERS-1) {
      if (frame==0) {
        frame=2;
      }
    }
    if (frame==0) {
      frame=12;
    }
  }
}
void display() {
  for (int i = 0; i <NUMBER_OF_NUMBERS;i++) {
    if (frame==2||frame==4||frame==6||frame==8) {
      fill(0, 0, 255);
    }
    else if (frame==3||frame==5||frame==7||frame==9) {
      fill(255);
    }
    else if (position==i) {
      fill(255, 255, 0);
    }
    else if (current==i) {
      fill(0);
    }
    else if (min==i) {
      fill(0, 255, 0);
    }
    else {
      fill(255);
    }
    rect(i*30, 100+NUMBER_OF_NUMBERS*20-numbers[i]*20, 10, numbers[i]*20);
  }
}



