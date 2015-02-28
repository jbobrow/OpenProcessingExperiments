
import Jama.*; 

/*
Using the Jama libray to take in denavit-Hartenberg parameters for a surgical
robot arm of (nj) joints/links and calculate the closed chain kinematics 
using the Newton-Rhapson solution.  Obstacles can be added or deleted. 

The alternative (there are many actually) is to use a path planning algorithm,
perhaps RRT to generate a path.  The Newton-Rhapson is only faster here because
only minor adjustments need to be made in order to find a configuration which 
fit around obstacles.  However, when faced with a maze-like obstacle a 
Probablistic Roadmap (PRM) will find a solution when there is one or return 
there is no solution, whereas this Newton-Rhapson will continuously hunt for a
solution when one does not exist.  Much work needs to be done to fix this problem.
*/

int nj = 13;              // number of joints
int num_obs = 300;        // number of obstacles
float obssz = 50;         // obstacle size
float obsb = 10;          // obstacle boundary padding        
double t = 0;             // time = 0

int backgroundcolor = 80;


//__________ARRAYS_________________________//
double[][] Rarray = {
  {
    0, -1
  }
  , {
    1, 0
  }
};
double phistart = 0;
double[][] spA_array = new double[2][1];
double[][] spB_array = new double[2][1];
double[][] rA_array = new double[2][1];
double[][] rB_array = new double[2][1];
double[][] r_array = new double[2][1];
double[][] A_array = new double[2][2];
double[][] B_array = new double[2][2];

//double[][] PHI_array = new double[nj*2+1][1];
double[][] PHI_array = new double[nj*2+2][1];
double[][] q_array = new double[(nj-1)*3][1];
double[][] q_array2 = new double[(nj-1)*3][1];
double[][] JAC_array = new double[(nj-1)*2+4][(nj-1)*3];
double[] phi = new double[nj];

//__________MATRICES________________//
Matrix R = new Matrix(Rarray);
Matrix spA[] = new Matrix[nj];
Matrix spB[] = new Matrix[nj];
Matrix rA[] = new Matrix[nj];
Matrix rB[] = new Matrix[nj];
Matrix r[] = new Matrix[nj];
Matrix A[] = new Matrix[nj];
Matrix B[] = new Matrix[nj];
Matrix spAt = new Matrix(2, 1);
Matrix spBt = new Matrix(2, 1);

Matrix PHI = new Matrix(PHI_array);
Matrix JAC = new Matrix(JAC_array);
Matrix PHI_orig = new Matrix(PHI_array);
Matrix JAC_orig = new Matrix(JAC_array);

Matrix q = new Matrix(q_array);

double [][] dh = new double[nj][4];

String[] lines;

PFont font1;
float [][][] obsp = new float[num_obs][4][2];
long frame = 0;
//____________________INITIALIZE/SETUP_____________________________//
void setup() 
{ 
  size(450, 600);
  
  lines = loadStrings("positions.txt");
  for (int i = 0; i < lines.length; i ++)
  {
    String[] pieces = split(lines[i], '\t');
    if (pieces.length == 4) {
      obsp[i][0][0] = float(pieces[0]);
      obsp[i][0][1] = float(pieces[1]);
      obsp[i][2][0] = float(pieces[2]);
      obsp[i][2][1] = float(pieces[3]);
    }
    obsp[i][1][0] = obsp[i][2][0];
    obsp[i][1][1] = obsp[i][0][1];
    obsp[i][3][0] = obsp[i][0][0];
    obsp[i][3][1] = obsp[i][2][1];
  }

  font1 = loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  stroke(255);

  num_obs = 20;
  for (int i = 0; i < num_obs; i ++) {
    
    //if (i >= lines.length) 
    if (i >= 0)
    {
      while(abs(obsp[i][0][0]) <= 40) obsp[i][0][0] = random(width-obssz)-width/2;
      while(abs(obsp[i][0][1]) <= 40) obsp[i][0][1] = random(height-200-obssz)-height/2+100;
      //obsp[i][0][0] = obsp_arrayx[i];
      //obsp[i][0][1] = obsp_arrayy[i];        
      obsp[i][1][0] = obsp[i][0][0]+obssz;
      obsp[i][1][1] = obsp[i][0][1];
      obsp[i][2][0] = obsp[i][0][0];
      obsp[i][2][1] = obsp[i][0][1]+obssz;
      obsp[i][3][0] = obsp[i][0][0]+obssz;
      obsp[i][3][1] = obsp[i][0][1]+obssz;
    }
    
  }

  for (int i = 0; i < nj; i ++)
  {
    dh[i][0] = 40;
    if (i % 2 == 0)    dh[i][3] = 100-i*30; 
    else     dh[i][3] = -dh[i-1][3];
  }

  Matrix dhMat = new Matrix(dh);
  dhMat.print(1, 1);

  for (int i = 0; i < nj; i ++)
  {
    spB_array[0][0] = dh[i][0];
    spB_array[1][0] = 0;
    spA[i] = new Matrix(2, 1);
    spB[i] = new Matrix(2, 1);
    phi[i] = radians((float)dh[i][3]);
    spAt = new Matrix(spA_array);
    spBt = new Matrix(spB_array);
    spA[i].setMatrix(0, 1, 0, 0, spAt);
    spB[i].setMatrix(0, 1, 0, 0, spBt);
  }

  phistart = phi[1];

  for (int i = 1; i < nj; i ++)
  {
    A[i] = getA(phi[i]);
    if (i > 1)  r[i] = A[i].times(spB[i]).plus(r[i-1]);
    else        r[i] = A[i].times(spB[i]);

    q_array[(i-1)*3][0] = r[i].get(0, 0);
    q_array[(i-1)*3+1][0] = r[i].get(1, 0);
    q_array[(i-1)*3+2][0] = phi[i];
  }

  q = new Matrix(q_array);
  for (int i = 0; i < nj; i ++) {
    rA[i] = new Matrix(2, 1);
    rB[i] = new Matrix(2, 1);
  }
  for (int i = 0; i < nj; i ++) rA[i].print(1, 1);
  for (int i = 0; i < nj; i ++) rB[i].print(1, 1);

  smooth();
  frameRate(30);
} 



float[] x = new float[2];
float[] y = new float[2];
//________________________MAIN_LOOP___________________________//
void draw() 
{
  frame++;
  t+=0.1;

  evalConstraint();  // calculate constraint vector
  newtonRhapson();   // qnew = qold * inv(jacobian)*constraint

  check_distances();  // check distance between each joint and object
  check_collision();  // check if any collision and which joint/obstacle

  int countmove = 0;
  while (max (movejoint) !=0 && countmove < 50) 
  {
    println("COLLISION!");

    for (int i = 0; i < nj; i++) {
      int obsInWay = movejoint[i];
      if (movejoint[i] != 0) {
        
        int num_iter = 10;
        for (int k = 1; k < num_iter; k ++) {
          double cAng = q.get((i-1)*3+2,0);
          if (k%2==0) q.set((i-1)*3+2, 0, cAng-k*(180/num_iter)*PI/180);
          else q.set((i-1)*3+2, 0, cAng+k*(180/num_iter)*PI/180);
            
          //q.set((i-1)*3+2, 0, random(360)*PI/180);
        }

        evalConstraint();
        newtonRhapson();

        check_distances();
        check_collision();
      }
      countmove++;
    }
  }

  background(backgroundcolor);
  stroke(255);
  strokeWeight(4);
  pushMatrix();
  translate(width/2, height/2);
  point(0, 0);

  for (int i = 1; i < nj-2; i ++) 
  {
    for (int j = 0; j < 2; j ++) {
      x[j] = (float)r[i+j].get(0, 0);
      y[j] = (float)r[i+j].get(1, 0);
    }
    strokeWeight(10);
    stroke(0, 0, 100);
    line(x[0], y[0], x[1], y[1]);
    
    int szellipse = 25;
    for (int j = 0; j < 2; j ++) {
      strokeWeight(0);
      fill(0);
      if (i!=nj-2 && j!=1) {
      
      ellipse(x[j], y[j], szellipse, szellipse);
      fill(255);
      textFont(font1, 12);
      text(str(i), x[j], y[j]);
      }
    }
  }
  add_obstacles();
  draw_gripper();
  popMatrix();

  stroke(255);
  textFont(font1, 25);
  text("2D Closed Chain Kinematics", width/2, 30);
  
  textFont(font1, 11);
  text("The robot finds a configuration to avoid random obstacles", width/2,50);
  textAlign(LEFT);
  textFont(font1, 10);
  text("Press 'i' to add an obstacle", 10,70);
  text("Press 'd' to delete an obstacle", 10,80);
  textAlign(CENTER);
  if (frame % 5 == 0 ) println("frame: " + frame);
  //print_stuff();
  //text(nj, width/6, 80);
}


//__________CONSTRAINTS_&_JACOBIAN_________________//
double [][] rBset_array = {
  {
    100.
  }
  , {
    0.
  }
};
void evalConstraint() 
{

  for (int i = 1; i < nj; i ++) 
  {
    r[i] = q.getMatrix((i-1)*3, (i-1)*3+1, 0, 0);
    phi[i] = q.get((i-1)*3+2, 0);
  }
  for (int i = 0; i < nj; i ++)
  {
    A[i] = getA(phi[i]);
    B[i] = A[i].times(R);
  }
  for (int i = 1; i < nj; i ++)
  {
    rA[i] = r[i].plus(A[i].times(spA[i]));
    rB[i] = r[i].plus(A[i].times(spB[i]));
  }

  rBset_array[0][0] = (double)(mouseX-width/2);
  rBset_array[1][0] = (double)(mouseY-height/2);

  Matrix rBset = new Matrix(rBset_array);
  
  for (int i = 0; i < nj-1; i ++)
  {
    if (i == 0)
    {
      PHI.setMatrix(i*2, i*2+1, 0, 0, rA[0].minus(rA[1]));

      JAC.setMatrix(i*2, i*2+1, i*3, i*3+1, Matrix.identity(2, 2).uminus());
      JAC.setMatrix(i*2, i*2+1, i*3+2, i*3+2, B[i+1].times(spA[i+1]));
      JAC.setMatrix(i*2+2, i*2+3, i*3, i*3+1, Matrix.identity(2, 2));
      JAC.setMatrix(i*2+2, i*2+3, i*3+2, i*3+2, B[i+1].times(spB[i+1]));
    }
    else 
    {
      PHI.setMatrix(i*2, i*2+1, 0, 0, rB[i].minus(rA[i+1]));

      JAC.setMatrix(i*2, i*2+1, i*3, i*3+1, Matrix.identity(2, 2).uminus());
      JAC.setMatrix(i*2, i*2+1, i*3+2, i*3+2, B[i+1].uminus().times(spA[i+1]));
      JAC.setMatrix(i*2+2, i*2+3, i*3, i*3+1, Matrix.identity(2, 2));
      JAC.setMatrix(i*2+2, i*2+3, i*3+2, i*3+2, B[i+1].times(spB[i+1]));
    }
  }  
  JAC.setMatrix(nj*2, nj*2+1, (nj-2)*3, (nj-2)*3+1, Matrix.identity(2, 2));
  PHI.setMatrix(nj*2, nj*2+1, 0, 0, rB[nj-1].minus(rBset));
}





//________________________NEWTON_RHAPSON________________________________//
double phimax = 0, phitest = 0, tolerance = 0.1;

void newtonRhapson()
{
  evalConstraint();

  phimax = 0;
  for (int i=0;i<nj*2+1;i++) { 
    if (abs((float)PHI.get(i, 0))>phimax) phimax=abs((float)PHI.get(i, 0));
  }
  int counter = 0;  
  while ( phimax > tolerance && counter < 5) 
  {
    Matrix x1 = pinv(JAC).times(PHI);
    q.minusEquals(x1);
    evalConstraint();

    phimax = 0;
    for (int i=0;i<nj*2+1;i++) { 
      if (abs((float)PHI.get(i, 0))>phimax) phimax=abs((float)PHI.get(i, 0));
    }  
    phitest = phimax;
    counter++;
  }
}


float [] vec = new float[nj];
//__________CLOSEST_OBSTACLES__________________//
int [][] clObs= new int[nj][2];
void check_distances() 
{
  float distance;
  int min_j = 0; 
  int closest_obs = 0;

  for (int i = 1; i < nj; i ++) 
  {    
    float min_distance = 1000;
    for (int k = 0; k < num_obs; k ++) 
    {
      for (int j=0; j < 4; j++)
      {
        distance = dist((float)r[i].get(0, 0), (float)r[i].get(1, 0), 
        obsp[k][j][0], obsp[k][j][1]);

        if (distance < min_distance) 
        {
          min_distance = distance; 
          min_j = j;
          closest_obs = k;
        }
      }
    }

    clObs[i][0] = closest_obs;    // closest object
    clObs[i][1] = min_j;          // closest vertex

    // determine the vector direction the joint should rotate
    // angle = tan-1( jointY-closestpoint of closest obstacle) / 
    // (jointX- "  ")
    vec[i] = atan(((float)r[i].get(0, 0)-obsp[clObs[i][0]][clObs[i][1]][1])/
      ((float)r[i].get(1, 0)-obsp[clObs[i][0]][clObs[i][1]][0]));
    //    print(i + " " + vec + "   ");
    if (frame % 2000 == 0) {
      print(i+" "+vec+"  ");
      print(i +  "o:" + closest_obs + "c: " + min_j + "  "); 
      //      //print((float)r[i].get(0, 0) + " y: " + (float)r[i].get(1, 0) + "  "); 
      if (i == nj-1)
        println("");
    }
  }
}




//__________DRAW_OBSTACLES_____________________//
void add_obstacles() 
{
  
  strokeWeight(0); 
  stroke(100);
  for (int i =0; i < num_obs; i ++) 
  {
    fill(0);
    rect(obsp[i][0][0]+obsb,obsp[i][0][1]+obsb,(obsp[i][1][0]-obsp[i][0][0])-obsb,obsp[i][2][1]-obsp[i][0][1]-obsb); 
    fill(205);
    textFont(font1, 15);
    text(i, obsp[i][0][0]+obssz/2+obsb/2, obsp[i][0][1]+obssz*2/3+obsb/4); 
    textFont(font1, 8);
    //for (int k = 0; k < 4; k ++) text(k, obsp[i][k][0]+5, obsp[i][k][1]+8);
  }  
  // uncomment to display line from each joint to closest obstacle corner.
  /*
  for (int i = 1; i < nj-1; i ++) 
  {
    stroke(backgroundcolor-5);
    stroke(0);
    float x = obsp[clObs[i][0]][clObs[i][1]][0];
    float y = obsp[clObs[i][0]][clObs[i][1]][1];
    line((float)r[i].get(0, 0), (float)r[i].get(1, 0), x, y);
  }*/
}




//__________JAMA_PSEUDO_INVERSE__________________//
// The following two functions are from Ahmed Abdelkader's JAMA blog:
// http://the-lost-beauty.blogspot.com/2009/04/moore-penrose-pseudoinverse-in-jama.html
public static double MACHEPS = 2E-16; 
//______________________________________________________________________//
Matrix pinv(Matrix x) {
  if (x.getColumnDimension() > x.getRowDimension())
    return pinv(x.transpose()).transpose();
  if (x.rank() < 1)
    return null;
  if (x.getColumnDimension() > x.getRowDimension())
    return pinv(x.transpose()).transpose();
  SingularValueDecomposition svdX = new SingularValueDecomposition(x);
  double[] singularValues = svdX.getSingularValues();
  double tol = Math.max(x.getColumnDimension(), x.getRowDimension()) * singularValues[0] * MACHEPS;
  double[] singularValueReciprocals = new double[singularValues.length];
  for (int i = 0; i < singularValues.length; i++)
    singularValueReciprocals[i] = Math.abs(singularValues[i]) < tol ? 0 : (1.0 / singularValues[i]);
  double[][] u = svdX.getU().getArray();
  double[][] v = svdX.getV().getArray();
  int min = Math.min(x.getColumnDimension(), u[0].length);
  double[][] inverse = new double[x.getColumnDimension()][x.getRowDimension()];
  for (int i = 0; i < x.getColumnDimension(); i++)
    for (int j = 0; j < u.length; j++)
      for (int k = 0; k < min; k++)
        inverse[i][j] += v[i][k] * singularValueReciprocals[k] * u[j][k];
  return new Matrix(inverse);
}
public static void updateMacheps() {
  MACHEPS = 1;
  do
    MACHEPS /= 2;
  while (1 + MACHEPS / 2 != 1);
}
//_________________________________________________________________//






//___________PRINT___________________//
void print_stuff()
{
  print("r"); 
  for (int i = 0; i < nj; i ++) r[i].print(1, 1);
  print("phi");
  for (int i = 0; i < nj; i ++) print(" " + phi[i]);
  print("rA");
  for (int i = 0; i < nj; i ++) rA[i].print(1, 1);
  print("rB");
  for (int i = 0; i < nj; i ++) rB[i].print(1, 1);

  print("spB");
  for (int i = 0; i < nj; i ++) spB[i].print(1, 1);
  print("spA");
  for (int i = 0; i < nj; i ++) spA[i].print(1, 1);

  print("A");
  for (int i = 0; i < nj; i ++) A[i].print(1, 1);
  print("B");
  for (int i = 0; i < nj; i ++) B[i].print(1, 1);
  JAC.print(1, 1);
  PHI.print(1, 1);
}





//_____________GET_ROTATION_MATRIX________//
Matrix getA(double phi) 
{
  double[][] Ain = {
    {
      cos((float)phi), -sin((float)phi)
      }
    , {
      sin((float)phi), cos((float)phi)
      }
    }; 
    Matrix Aout = new Matrix(Ain);
  return Aout;
}

int [] movejoint = new int[nj];
void check_collision()
{
  for (int i = 1; i < nj-2; i ++)   // for each joint
  {  
    movejoint[i] = 0;
    for (int j = 0 ; j < num_obs; j ++)   // check each obstacle
    {
      for (int k = 0; k < 4; k ++)  // each line
      {
        int coll;

        if (k == 3) 
          coll = collision_detect(r[i].get(0, 0), 
          r[i+1].get(0, 0), r[i].get(1, 0), 
          r[i+1].get(1, 0), (double)obsp[j][0][0], (double)obsp[j][3][0], 
          (double)obsp[j][0][1], (double)obsp[j][3][1]);
        else
          coll = collision_detect(r[i].get(0, 0), 
          r[i+1].get(0, 0), r[i].get(1, 0), 
          r[i+1].get(1, 0), (double)obsp[j][k][0], (double)obsp[j][k+1][0], 
          (double)obsp[j][k][1], (double)obsp[j][k+1][1]);

        if (coll == 1)    movejoint[i] = j+1;
      }
    }
    //print(i + "_" + movejoint[i] + " ");
  }
  //println("");
}

void draw_gripper() 
{
  int x=30, y = 15;
  
  //stroke(0,0,10);
  stroke(255); 
  strokeWeight(10);
  pushMatrix();
  translate((float)r[nj-2].get(0, 0),(float)r[nj-2].get(1, 0));
  rotate((float)phi[nj-3]);
  line(0,0,0,y);
  line(0,0,0,-y);
  line(0,y,x,y);
  line(0,-y,x,-y);
  popMatrix();
}

int collision_detect(double X1, double X2, double Y1, double Y2, 
double X3, double X4, double Y3, double Y4)
{

  double X4_X3 = X4-X3;
  double X1_X3 = X1-X3;
  double X2_X1 = X2-X1;
  double Y4_Y3 = Y4-Y3;
  double Y1_Y3 = Y1-Y3;
  double Y2_Y1 = Y2-Y1;

  double num_a = X4_X3 * Y1_Y3 - Y4_Y3 * X1_X3;
  double num_b = X2_X1 * Y1_Y3 - Y2_Y1 * X1_X3;
  double den = Y4_Y3 * X2_X1 - X4_X3 * Y2_Y1;

  if (den == 0) den = 0.0001; 

  double u_a = num_a / den;
  double u_b = num_b / den;

  double INT_X = X1+X2_X1*u_a;
  double INT_Y = Y1+Y2_Y1*u_a;
  boolean INT_Bbool = (u_a >= 0) & (u_a <= 1) & (u_b >= 0) & (u_b <= 1);

  int INT_B = 1;
  if (INT_Bbool==true) INT_B = 1;
  else INT_B = 0;

  return INT_B;
}


void keyPressed() {
   if (key == 'i' && num_obs < 300) {
      num_obs++;
      while(abs(obsp[num_obs-1][0][0]) <= 40) obsp[num_obs-1][0][0] = random(width-obssz)-width/2;
      while(abs(obsp[num_obs-1][0][1]) <= 40) obsp[num_obs-1][0][1] = random(height-100-obssz)-height/2+100;        
      obsp[num_obs-1][1][0] = obsp[num_obs-1][0][0]+obssz;
      obsp[num_obs-1][1][1] = obsp[num_obs-1][0][1];
      obsp[num_obs-1][2][0] = obsp[num_obs-1][0][0];
      obsp[num_obs-1][2][1] = obsp[num_obs-1][0][1]+obssz;
      obsp[num_obs-1][3][0] = obsp[num_obs-1][0][0]+obssz;
      obsp[num_obs-1][3][1] = obsp[num_obs-1][0][1]+obssz;
   }
   else if (key == 'd' && num_obs > 0)
    num_obs--;
  
}


