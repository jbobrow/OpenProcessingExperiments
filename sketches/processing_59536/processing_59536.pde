
/**
 *    Genetic Algorithm by kof 2012
 *    Shape coordinates esimation
 */


PGraphics source;
ArrayList agent;
Quad estimation;

int monkeys = 4;
float smoothing_out = 10.0;

void setup() {



  size(512, 256, P2D); 


  textFont(loadFont("SempliceRegular-8.vlw"));
  textMode(SCREEN);

  restart();
}

void mousePressed() {
  restart();
}

void restart() {


  makeSource();

  estimation = new Quad(smoothing_out);

  agent = new ArrayList();
  for (int i =0  ; i < monkeys;i++) {
    agent.add(new Agent());
  }
}

void makeSource() {
  source = createGraphics(height, height, JAVA2D);

  source.beginDraw();
  source.background(255);
  source.fill(0);
  source.noStroke();
  source.quad(
  random(source.width/2.), random(source.height/2.), 
  random(source.width/2.)+source.width/2., random(source.height/2.), 
  random(source.width/2.+source.width/2.), random(source.height/2.)+source.height/2., 
  random(source.width/2.), random(source.height/2)+source.height/2.
    );

  source.endDraw(); 


  source.loadPixels();
}

void draw() {

  background(255);

  for (int z =0  ; z < agent.size();z++) {

    Agent ag = (Agent)agent.get(z);  


    //new generation
    ag.newGen();


    for (int i =0  ; i < agent.size();i++) {
      for (int ii =0  ; ii < agent.size();ii++) {
        if (i!=ii) {
          Agent a = (Agent)agent.get(i);
          Agent b = (Agent)agent.get(ii); 

          if (a.error > b.error) {
            a.inject(b.dna, 0.75);//(a.error - b.error)*10);
          } 
          else {
            b.inject(a.dna, 0.75);//(b.error - a.error)*10);
          }
        }
      }
    }


    estimation.input(ag);


    tint(255, 255/(agent.size()+0.0)+20.0);
    image(ag.result, width/2, 0);
  }


  // double interaction ? (not very helpful)
  for (int i =0  ; i < agent.size();i++) {
    for (int ii =0  ; ii < agent.size();ii++) {
      if (i!=ii) {
        Agent a = (Agent)agent.get(i);
        Agent b = (Agent)agent.get(ii); 

        if (a.error > b.error) {
          a.inject(b.dna, 0.75);//(a.error - b.error)*10);
        } 
        else {
          b.inject(a.dna, 0.75);//(b.error - a.error)*10);
        }
      }
    }
  }




  noTint();

  image(source, 0, 0);

  noFill();
  stroke(#ff0000);
  estimation.draw();
}


class Quad {
  PVector one, two, three, four;
  float speed = 100.0;
  float error = 1.0;
  float slow = 10.0;
  int generation;
  String dna;

  Quad(float _speed) {
    speed = _speed;

    one= new PVector(random(source.width/2), random(source.height/2));
    two= new PVector(random(source.width/2+source.width/2), random(source.height/2));
    three=new PVector(random(source.width/2+source.width/2), random(source.height/2+source.height/2)); 
    four=  new PVector(random(source.width/2), random(source.height/2+source.height/2));
  }

  void input(Agent a) {
    one.x += (a.x[0]-one.x)/(speed+a.error*slow);
    one.y += (a.y[0]-one.y)/(speed+a.error*slow);
    two.x += (a.x[1]-two.x)/(speed+a.error*slow);
    two.y += (a.y[1]-two.y)/(speed+a.error*slow);
    three.x += (a.x[2]-three.x)/(speed+a.error*slow);
    three.y += (a.y[2]-three.y)/(speed+a.error*slow);
    four.x += (a.x[3]-four.x)/(speed+a.error*slow);
    four.y += (a.y[3]-four.y)/(speed+a.error*slow);

    error += (a.error-error)/speed;
    generation = a.generation;
    
    dna = a.dna;
  }

  void draw() {

    quad(
    one.x, one.y, 
    two.x, two.y, 
    three.x, three.y, 
    four.x, four.y
      );


    fill(#ff0000);
    text(round(one.x*10.0)/10.0+", "+round(one.y*10.0)/10.0, one.x, one.y);
    text(round(two.x*10.0)/10.0+", "+round(two.y*10.0)/10.0, two.x, two.y);
    text(round(three.x*10.0)/10.0+", "+round(three.y*10.0)/10.0, three.x, three.y);
    text(round(four.x*10.0)/10.0+", "+round(four.y*10.0)/10.0, four.x, four.y);

    text("error: "+error, width/2+10, 10);
    text("generation: "+generation, width /2. + 10, 20);
    
    textAlign(CENTER);
    text(dna,width - width/4,height-10);
    textAlign(LEFT);
  }
}

class Agent {
  float error = 1.0;
  String dna = "";
  int generation = 0;
  PGraphics result;
  boolean debug = false;
  float rate = 0.35;


  float x[] = new float[4];
  float y[] = new float[4];

  float sx[] = new float[4];
  float sy[] = new float[4];


  Agent() {

    rate = random(0.01, 0.4);
    result = createGraphics(source.width, source.height, P2D);

    for (int i =0;i<4*3*2;i++) {
      dna += (char)random(48, 58);
    }
  }

  void newGen() {

    String tmpDna = evolve(dna, error);

    float tmpError = test(tmpDna);

    if (debug) {
      println("-------------- > generation #"+generation);
      println(dna);
      println(tmpDna);

      println(error+" / "+tmpError);
    }

    //getting better !
    if (tmpError < error) {
      dna = tmpDna;
      error = tmpError;
      for (int i =0 ; i < x.length;i++) {
        x[i] = sx[i];
        y[i] = sy[i];
      }

      //rate += (error-rate) / 5000.0;
    }

    // you call this perfect ? try again
    error+=0.0001;

    generation++;
  }

  float test(String _dna) {

    sx[0] = map(parseFloat(_dna.substring(0, 3)), 0, 999, 0, source.width);
    sx[1] = map(parseFloat(_dna.substring(3, 6)), 0, 999, 0, source.width);
    sx[2] = map(parseFloat(_dna.substring(6, 9)), 0, 999, 0, source.width);
    sx[3] = map(parseFloat(_dna.substring(9, 12)), 0, 999, 0, source.width);

    sy[0] = map(parseFloat(_dna.substring(12, 15)), 0, 999, 0, source.width);
    sy[1] = map(parseFloat(_dna.substring(15, 18)), 0, 999, 0, source.width);
    sy[2] = map(parseFloat(_dna.substring(18, 21)), 0, 999, 0, source.width);
    sy[3] = map(parseFloat(_dna.substring(21, 24)), 0, 999, 0, source.width);

    //println(ax+""+bx+""+cx+""+dx);
    //println(ay+""+by+""+cy+""+dy);

    result.beginDraw();
    result.background(255);
    result.fill(0);
    result.noStroke();



    result. quad(sx[0], sy[0], sx[1], sy[1], sx[2], sy[2], sx[3], sy[3]);
    result.endShape(CLOSE);
    result.endDraw();

    //result.updatePixels();

    result.loadPixels();

    float res = evaluate();

    return res;
  }

  float evaluate() {

    float _error = 0;
    for (int i =0 ; i < source.pixels.length;i++) {
      _error += map(abs(brightness(source.pixels[i])-brightness(result.pixels[i])), 0, 255, 0, 1);
    } 

    _error /= (source.pixels.length+0.0);

    return _error;
  }


  String evolve(String _src, float _error) {

    String _dna ="";
    for (int i = 0; i < _src.length();i++) {

      if (random(0, 1000) / 1000.0 < rate) {

        int val = 1;





        val = (int)random(0, 10);
        /*
        else {
         val = ((int)_src.charAt(i)-48);
         val += (int)(random(-2, 3));
         if (val>9)val = 0;
         if (val<0)val = 9;
         }*/

        _dna += val+"";
      }
      else {
        _dna += _src.charAt(i);
      }
    }

    return _dna;
  }

  void inject(String _dna, float _prob) {
    String backup = dna;
    dna = "";
    for (int i = 0; i < _dna.length();i++) {
      if (random(0, 1000) / 1000.0 < _prob) {
        dna += _dna.charAt(i);
      }
      else {
        dna += backup.charAt(i);
      }
    }
  }
}


