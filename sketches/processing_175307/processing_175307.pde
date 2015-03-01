
class Perceptron {
  //[full] The Perceptron stores its weights and learning constants.
  float[] weights;
  float c = 0.01;
  //[end]

  Perceptron(int n) {
    weights = new float[n];
    //[full] Weights start off random.
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1,1);
    }
    //[end]
  }

  //[full] Return an output based on inputs.
  int feedforward(float[] inputs) {
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i]*weights[i];
    }
    return activate(sum);
  }
  //[end]

  //[full] Output is a +1 or -1.
  int activate(float sum) {
    if (sum > 0) return 1;
    else return -1;
  }
  //[end]

  //[full] Train the network against known data.
  void train(float[] inputs, int desired) {
    int guess = feedforward(inputs);
    float error = desired - guess;
    for (int i = 0; i < weights.length; i++) {
      weights[i] += c * error * inputs[i];
    }
  }
  //[end]
}

class Trainer {

  // A "Trainer" object stores the inputs and the correct answer.
  float[] inputs;
  int answer;

  Trainer(float x, float y, int a) {
    inputs = new float[3];
    inputs[0] = x;
    inputs[1] = y;
    // Note that the Trainer has the bias input built into its array.
    inputs[2] = 1;
    answer = a;
  }
}

// The Perceptron
Perceptron ptron;
// 2,000 training points
Trainer[] training = new Trainer[2000];
int count = 0;

//[full] The formula for a line
float f(float x) {
  return 2*x+1;
}
//[end]

void setup() {
  size(640, 360);

  ptron = new Perceptron(3);

  // Make 2,000 training points.
  for (int i = 0; i < training.length; i++) {
    float x = random(-width/2,width/2);
    float y = random(-height/2,height/2);
    //[full] Is the correct answer 1 or -1?
    int answer = 1;
    if (y < f(x)) answer = -1;
    //[end]
    training[i] = new Trainer(x, y, answer);
  }
}


void draw() {
  background(255);
  translate(width/2,height/2);

  ptron.train(training[count].inputs, training[count].answer);
  // For animation, we are training one point at a time.
  count = (count + 1) % training.length;

  for (int i = 0; i < count; i++) {
    stroke(0);
    int guess = ptron.feedforward(training[i].inputs);
    //[full] Show the classification
    // no fill for -1, black for +1.
    if (guess > 0) noFill();
    else           fill(0);
    //[end]
    ellipse(training[i].inputs[0], training[i].inputs[1], 8, 8);
  }
}
