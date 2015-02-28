
///////////////////////////////////////////////
/* A simple implementation of Robert Axelrod's
 adaptive culture model.
 
 "The basic idea is that agents who are similar
 to each other are likely to interact and then
 become even more similar" (Axelrod, 1997) */
//////////////////////////////////////////////

// settings
int num_rows = 10, num_columns = 7, num_features = 5;
int range = round((100/ num_features)) * num_features;
// make a 2D grid
Individual ind[][] = new Individual[num_rows][num_columns];

void setup () {
  int wid = (num_features * num_columns * 10) + 30;
  int hei = (num_rows * 20) + 30;
  // size(wid, hei) // bit of a hack
  size(380, 230);
  frameRate(30);
  
  // set a font
  PFont font = loadFont("ArialMT-15.vlw");
  fill(0);
  textFont(font, 15);

  // initialise and set individual positions in grid
  int x_ = 20, y_ = 30;

  for (int i = 0; i < num_rows; ++i) {
    for (int j = 0; j < num_columns; ++j) {
      ind[i][j] = new Individual();
      ind[i][j].x = x_;
      ind[i][j].y = y_;
      x_ += 10 * num_features;
    }
    y_ += 20;
    x_ = 20;
  }
}

void draw () {
  background(255);

  // choose a random individual
  int row = (int) random(0, num_rows), column = (int) random (0, num_columns);

  // choose a neighbour
  Individual neighbour = chooseNeighbour(row, column);

  // calculate the similarity between the random pair
  // use this to decide if they will interact
  if (decideInteraction(calculateSimilarity(ind[row][column], neighbour)))
    interact(ind[row][column], neighbour);

  display();
}

Individual chooseNeighbour(int row_, int column_) {
  // an array of possible immediate neighbours in the grid
  ArrayList choices = new ArrayList();
  Individual neighbour_ = new Individual();

  // make sure immediate neighbours are inside the grid
  // and add them to possible choices
  if (column_ + 1 < num_columns)
    choices.add(ind[row_][column_+1]);
  if (column_ - 1 > -1)
    choices.add(ind[row_][column_-1]);
  if (row_ + 1 < num_rows)
    choices.add(ind[row_+1][column_]);
  if (row_ - 1 > -1)
    choices.add(ind[row_-1][column_]);

  // return a random neighbour
  int ran = (int) random(0, choices.size());
  neighbour_ = (Individual) choices.get(ran);

  return neighbour_;
}

int calculateSimilarity (Individual one_, Individual two_) {
  int chance = 0;

  // count how many features are the same
  for (int i = 0; i < num_features; ++i) {
    if (one_.features[i] == two_.features[i])
      chance++;
  }
  // scale similarity
  return chance *= round((100 / num_features));
}

boolean decideInteraction (int chance_) {
  int die = (int) random(1, range); // pick a random number

  if (chance_ > range - 1) // identical individuals
    return false;
  else if (die < chance_)
    return true;
  else
    return false;
}

void interact (Individual one_, Individual two_) {
  // an array of possible features to copy
  ArrayList choices = new ArrayList();

  for (int i = 0; i < num_features; ++i) {
    if (two_.features[i] != one_.features[i])
      choices.add(i); // add the index of different features to possible choices
  }

  // pick one of the different features at random
  // and copy it into the first individual  
  int ran = (int) random(0, choices.size());

  Integer index = (Integer) choices.get(ran);  
  one_.features[index.intValue()] = two_.features[index.intValue()];
}

void display() {
  // print individuals to screen
  for (int i = 0; i < num_rows; ++i) {
    for (int j = 0; j < num_columns; ++j) {
      ind[i][j].printInd();
    }
  }
}


