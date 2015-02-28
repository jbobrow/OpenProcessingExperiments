
/**
 * Class for a fluid field from www.openprocessing.org 
 *Java implementation of the Navier-Stokes-Solver from
 * http://www.dgp.toronto.edu/people/stam/reality/Research/pdf/GDC03.pdf
 */
 
class FluidField {
  final static int N = 45; //number of cells in the grid of the vector field
  final static int SIZE = (N + 2) * (N + 2);
  float[] u = new float[SIZE];
  float[] v = new float[SIZE];
  float[] u_prev = new float[SIZE];
  float[] v_prev = new float[SIZE];
  float[] dense = new float[SIZE];
  float[] dense_prev = new float[SIZE];

  FluidField() {
  }

  float getDx(int x, int y) {
    return u[INDEX(x+1, y+1)];
  }

  float getDy(int x, int y) {
    return v[INDEX(x+1, y+1)];
  }

  void applyForce(int cellX, int cellY, float vx, float vy) {
    cellX += 1;
    cellY += 1;
    float dx = u[INDEX(cellX, cellY)];
    float dy = v[INDEX(cellX, cellY)];

    u[INDEX(cellX, cellY)] = (vx != 0) ? PApplet.lerp((float) vx,
    (float) dx, 0.85f) : dx;
    v[INDEX(cellX, cellY)] = (vy != 0) ? PApplet.lerp((float) vy,
    (float) dy, 0.85f) : dy;
  }

  void tick(float dt, float visc, float diff) {
    vel_step(u, v, u_prev, v_prev, visc, dt);
    dens_step(dense, dense_prev, u, v, diff, dt);
  }

  // method used to be 'static' since this class is not a top level type
  final int INDEX(int i, int j) {
    return i + (N + 2) * j;
  }

  // same applies to the swap operation ^^
  final void SWAP(float[] x0, float[] x) {
    float[] tmp = new float[SIZE];
    System.arraycopy(x0, 0, tmp, 0, SIZE);
    System.arraycopy(x, 0, x0, 0, SIZE);
    System.arraycopy(tmp, 0, x, 0, SIZE);
  }

  void add_source(float[] x, float[] s, float dt) {
    int i, size = (N + 2) * (N + 2);
    for (i = 0; i < size; i++)
      x[i] += dt * s[i];
  }

  void diffuse(int b, float[] x, float[] x0, float diff, float dt) {
    int i, j, k;
    float a = dt * diff * N * N;
    for (k = 0; k < 20; k++) {
      for (i = 1; i <= N; i++) {
        for (j = 1; j <= N; j++) {
          x[INDEX(i, j)] = (x0[INDEX(i, j)] + a
            * (x[INDEX(i - 1, j)] + x[INDEX(i + 1, j)] + x[INDEX(i, j - 1)] + x[INDEX(
          i, j + 1)]))
            / (1 + 4 * a);
        }
      }
      set_bnd(b, x);
    }
  }

  void advect(int b, float[] d, float[] d0, float[] u, float[] v, float dt) {
    int i, j, i0, j0, i1, j1;
    float x, y, s0, t0, s1, t1, dt0;
    dt0 = dt * N;
    for (i = 1; i <= N; i++) {
      for (j = 1; j <= N; j++) {
        x = i - dt0 * u[INDEX(i, j)];
        y = j - dt0 * v[INDEX(i, j)];
        if (x < 0.5)
          x = 0.5;
        if (x > N + 0.5)
          x = N + 0.5;
        i0 = (int) x;
        i1 = i0 + 1;
        if (y < 0.5)
          y = 0.5;
        if (y > N + 0.5)
          y = N + 0.5;
        j0 = (int) y;
        j1 = j0 + 1;
        s1 = x - i0;
        s0 = 1 - s1;
        t1 = y - j0;
        t0 = 1 - t1;
        d[INDEX(i, j)] = s0 * (t0 * d0[INDEX(i0, j0)] + t1 * d0[INDEX(i0, j1)])
          + s1 * (t0 * d0[INDEX(i1, j0)] + t1 * d0[INDEX(i1, j1)]);
      }
    }
    set_bnd(b, d);
  }

  void set_bnd(int b, float[] x) {
    int i;
    for (i = 1; i <= N; i++) {
      x[INDEX(0, i)] = (b == 1) ? -x[INDEX(1, i)] : x[INDEX(1, i)];
      x[INDEX(N + 1, i)] = b == 1 ? -x[INDEX(N, i)] : x[INDEX(N, i)];
      x[INDEX(i, 0)] = b == 2 ? -x[INDEX(i, 1)] : x[INDEX(i, 1)];
      x[INDEX(i, N + 1)] = b == 2 ? -x[INDEX(i, N)] : x[INDEX(i, N)];
    }
    x[INDEX(0, 0)] = 0.5 * (x[INDEX(1, 0)] + x[INDEX(0, 1)]);
    x[INDEX(0, N + 1)] = 0.5 * (x[INDEX(1, N + 1)] + x[INDEX(0, N)]);
    x[INDEX(N + 1, 0)] = 0.5 * (x[INDEX(N, 0)] + x[INDEX(N + 1, 1)]);
    x[INDEX(N + 1, N + 1)] = 0.5 * (x[INDEX(N, N + 1)] + x[INDEX(N + 1, N)]);
  }

  void dens_step(float[] x, float[] x0, float[] u, float[] v, float diff,
  float dt) {
    add_source(x, x0, dt);
    SWAP(x0, x);
    diffuse(0, x, x0, diff, dt);
    SWAP(x0, x);
    advect(0, x, x0, u, v, dt);
  }

  void vel_step(float[] u, float[] v, float[] u0, float[] v0, float visc,
  float dt) {
    add_source(u, u0, dt);
    add_source(v, v0, dt);
    SWAP(u0, u);
    diffuse(1, u, u0, visc, dt);
    SWAP(v0, v);
    diffuse(2, v, v0, visc, dt);
    project(u, v, u0, v0);
    SWAP(u0, u);
    SWAP(v0, v);
    advect(1, u, u0, u0, v0, dt);
    advect(2, v, v0, u0, v0, dt);
    project(u, v, u0, v0);
  }


  void project(float[] u, float[] v, float[] p, float[] div) {
    int i, j, k;
    float h;
    h = 1.0 / N;
    for (i = 1; i <= N; i++) {
      for (j = 1; j <= N; j++) {
        div[INDEX(i, j)] = -0.5
          * h
          * (u[INDEX(i + 1, j)] - u[INDEX(i - 1, j)] + v[INDEX(i, j + 1)] - v[INDEX(
        i, j - 1)]);
        p[INDEX(i, j)] = 0;
      }
    }
    set_bnd(0, div);
    set_bnd(0, p);
    for (k = 0; k < 20; k++) {
      for (i = 1; i <= N; i++) {
        for (j = 1; j <= N; j++) {
          p[INDEX(i, j)] = (div[INDEX(i, j)] + p[INDEX(i - 1, j)]
            + p[INDEX(i + 1, j)] + p[INDEX(i, j - 1)] + p[INDEX(i, j + 1)]) / 4;
        }
      }
      set_bnd(0, p);
    }
    for (i = 1; i <= N; i++) {
      for (j = 1; j <= N; j++) {
        u[INDEX(i, j)] -= 0.5 * (p[INDEX(i + 1, j)] - p[INDEX(i - 1, j)]) / h;
        v[INDEX(i, j)] -= 0.5 * (p[INDEX(i, j + 1)] - p[INDEX(i, j - 1)]) / h;
      }
    }
    set_bnd(1, u);
    set_bnd(2, v);
  }
}


