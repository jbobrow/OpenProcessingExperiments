
//Sun Kyung Park
//andrewID: sunkyunp
//Copyright Sun Kyung Park oct 2012

int [] numbers = {
  1, 5, 10, 20, 50, 100, 150, 180, 200, 150
};

void setup () {
  size (400, 400);
  background (171, 227, 242);
  fill (0);
  textAlign (CENTER);

  text ("Length of the array: " + numbers.length, 200, 200);
  text ("Sum of values in array: " + findSum (), 200, 220);
  text ("Average of the values in array: " + findAverage (), 200, 240);
  text ("Sum of all values in array \n greater than average all values: " + findGiven (), 200, 260);
}

int findSum () {
  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    sum = sum + numbers [i];
  }
  return sum;
}

float findAverage () {
  
  return findSum () /numbers.length;
}

float findGiven () {
  float sum = 0;
  float average = findAverage ();

  for (int i = 0; i < numbers.length; i++ ) {
    if (numbers [i] > average ) {
      sum = sum + numbers [i];
    }
  }
  return sum;
}


