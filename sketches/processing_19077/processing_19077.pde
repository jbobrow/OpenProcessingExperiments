
int N = 20; // matrix dimension
int MAXITER = 10000; // maximum iterations
float EPSILON = 1.0; // convergence condition

int GRID = 450; // cannot be changed
int RSIZE = GRID/N;

float[][] xnew, xold, temp;
int i, j, iter;
float thisdiff, maxdiff;

void iterate() {
    maxdiff = 0.0;
    for (i = 1; i < N-1; i++) {
        for (j = 1; j < N-1; j++) {
            xnew[i][j] = 0.25 *
                (xold[i-1][j]+xold[i+1][j]+xold[i][j-1]+xold[i][j+1]);
            if ((thisdiff = abs(xnew[i][j]-xold[i][j])) > maxdiff) {
                maxdiff = thisdiff;
            }
        }
    }
    temp = xold;
    xold = xnew;
    xnew = temp;
    return;
}

void setup() {
    size(450, 450);
    
    colorMode(RGB);
    textAlign(CENTER);
    textSize(20);
    iter = 0;
    xold = new float[N][N];
    xnew = new float[N][N];
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            xnew[i][j] = xold[i][j] = random(0, 255);
        }
    }
}

void draw() {
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            stroke(xold[i][j]);
            fill(xold[i][j]);
            rect(i*RSIZE, j*RSIZE, RSIZE, RSIZE);
        }
    }
    
    if (iter < MAXITER) {
        iterate();
        iter++;
    }
    else {
        fill(128, 0, 0);
        text("maximum iterations exceeded",
             width/2, height/2);
        exit();
    }

    if (maxdiff < EPSILON) {
        fill(64, 255, 64);
        text("convergence after " + iter + " iterations",
             width/2, height/2);
        exit();
    }    
}                                               
