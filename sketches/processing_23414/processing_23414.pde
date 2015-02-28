
int N = 12; // matrix dimension

float[][] mat1, mat2, mat3;
int i, j, k, mati, matj, matk = -1, oldi, oldj, oldk;

void setup() {
    size(450, 450);
    
    colorMode(RGB, N);
    textAlign(CENTER);
    textSize(20);
    
    mat1 = new float[N][N];
    mat2 = new float[N][N];
    mat3 = new float[N][N];
    
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            mat1[i][j] = mat2[i][j] = mat3[i][j] = 0;
        }
    }
    
}

void draw() {

    iterate();

    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            // redraw
            // mat1
            stroke(mat1[i][j], 0, 0);
            fill(mat1[i][j], 0, 0);
            rect(j*10, i*10 + 200, 10, 10);
            
            // mat2
            stroke(0, 0, mat2[i][j]);
            fill(0, 0, mat2[i][j]);
            rect(j*10 + 200, i*10, 10, 10);
                
            // mat3
            stroke(mat3[i][j], 0, mat3[i][j]);
            fill(mat3[i][j], 0, mat3[i][j]);
            rect(j*10 + 200, i*10 + 200, 10, 10);
    
            // mat1[i][j]
            // mat2[j][k]
            // mat3[i][k]
        }
    }
    
    // termination condition
    if (mati == N && matj == N && matk == N) {
        exit();
    }

}              

void iterate() {

    // overwrite old
    mat1[mati][matj] = 0;
    mat2[matj][matk] = 0;
    
//    oldi = mati;
//    oldj = matj;
//    oldk = matk;

    matk++;
    if (matk == N) {
        matk = 0;
        matj++;
        if (matj == N) {
            matj = 0;
            mati++;
        }
    }
    
    mat1[mati][matj] = N;
    mat2[matj][matk] = N;
    mat3[mati][matk]++;
}
                                                                                                                                                                                                
