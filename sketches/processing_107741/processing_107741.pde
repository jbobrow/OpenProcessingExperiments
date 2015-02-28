
class Bicubic
{
  int max_pixel_value_hue = 255;
  int max_pixel_value_bright = 255;

  int in_width, in_height, out_width, out_height, larger_out_dimension;
  int n, d, index;      //r = n/d - magnitude equals nominator/denominator, both integers

  int [] L;
  float [][] f_H;
  float [][] f_S;
  float [][] f_B;
  float [][] g_H;
  float [][] g_S;
  float [][] g_B;
  float [][] c;
  float [] h_H;
  float [] h_S;
  float [] h_B;
  color [][] g;
  float x;
  float y;
  float z;
  float a;

  Bicubic()
  {
  }

  Bicubic(color [][] color_table, float mag)
  {
    in_width   = color_table.length;
    in_height  = color_table[0].length;
    out_width  = (int) mag*in_width;
    out_height = (int) mag*in_height;
    if (out_width - out_height != 0) larger_out_dimension = (out_width > out_height) ? out_width : out_height;
    else larger_out_dimension = out_width;

    L = new int [larger_out_dimension];
    f_H = new float [in_width][in_height];
    f_S = new float [in_width][in_height];
    f_B = new float [in_width][in_height];
    g_H = new float [out_width][out_height];
    g_S = new float [out_width][out_height];
    g_B = new float [out_width][out_height];
    c = new float [4][larger_out_dimension];
    h_H = new float [in_width];
    h_S = new float [in_width];
    h_B = new float [in_width];
    g = new color[out_width][out_height];
    n = (int) mag;
    d = 1;
    a = -0.5;
    for (int i = 0; i < in_width; ++i)
    {
      for (int j = 0; j < in_height; ++j)
      {
        f_H[i][j] =  (color_table[i][j]>>16)&0xFF;  
        f_S[i][j] =  (color_table[i][j]>>8)&0xFF;      
        f_B[i][j] =  (color_table[i][j])&0xFF;
      }
    }
  }

  color [][] magnify()
  {    
    //index - will see if it works .... 
    for (int i = 0; i < larger_out_dimension; ++i)
    {
      L[i] = floor(i * d) / n;
    }
    //look-up table
    for (int i = 0; i < n; ++i)
    {
      x = (float) ((i * d) % n) / (float) n;
      c[0][i] = C0(x);
      c[1][i] = C1(x);
      c[2][i] = C2(x);
      c[3][i] = C3(x);
    }

    for (int i = n; i < larger_out_dimension; ++i)  
      for (int l = 0; l < 4; ++l)    
        c[l][i] = c[l][i % n];

    for (int i = 0; i < out_height; ++i)
    {
      for (int k = 0; k < in_width; ++k)
      {
        h_H[k] = 0.0;
        h_S[k] = 0.0;
        h_B[k] = 0.0;
        for (int l = 0; l < 4; ++l)
        {
          index = L[i] + l - 1;
          if (index < 0) {
            h_H[k] += f_H[0][k] * c[3 - l][i];
            h_S[k] += f_S[0][k] * c[3 - l][i];
            h_B[k] += f_B[0][k] * c[3 - l][i];
          }
          else if (index < in_height) {
            h_H[k] += f_H[index][k] * c[3 - l][i];
            h_S[k] += f_S[index][k] * c[3 - l][i];
            h_B[k] += f_B[index][k] * c[3 - l][i];
          }
          else {
            h_H[k] += f_H[in_height - 1][k] * c[3 - l][i];
            h_S[k] += f_S[in_height - 1][k] * c[3 - l][i];
            h_B[k] += f_B[in_height - 1][k] * c[3 - l][i];
          }
        }
      }
      for (int j = 0; j < out_width; ++j)
      {
        x = 0.5;
        y = 0.5;
        z = 0.5;
        for (int l = 0; l < 4; ++l)
        {
          index = L[j] + l - 1;
          if (index < 0) {
            x += h_H[0] * c[3 - l][j];
            z += h_S[0] * c[3 - l][j];
            y += h_B[0] * c[3 - l][j];
          }
          else if (index < in_width) {
            x += h_H[index] * c[3 - l][j];
            z += h_S[index] * c[3 - l][j];
            y += h_B[index] * c[3 - l][j];
          }
          else {
            x += h_H[in_width - 1] * c[3 - l][j];
            z += h_S[in_width - 1] * c[3 - l][j];
            y += h_B[in_width - 1] * c[3 - l][j];
          }
        }

        //check
        if (x <= 0.0)
          g_H[j][i] = 0;
        else if (x >= max_pixel_value_hue)
          g_H[j][i] = max_pixel_value_hue;
        else
          g_H[j][i] = (int) x;

        if (z <= 0.0)
          g_S[j][i] = 0;
        else if (z >= max_pixel_value_hue)
          g_S[j][i] = max_pixel_value_hue;
        else
          g_S[j][i] = (int) z;


        if (y <= 0.0)
          g_B[j][i] = 0;
        else if (y >= max_pixel_value_bright)
          g_B[j][i] = max_pixel_value_bright;
        else
          g_B[j][i] = (int) y;
      }
    }

    for (int i = 0; i < out_width; ++i)
    {
      for (int j = 0; j < out_height; ++j)
      { 
        float [] hsb = Color.RGBtoHSB((int)g_H[j][i], (int)g_S[j][i], (int)g_B[j][i], null);

        float hue = map(hsb[0], 0, 1, 0, 360);
        float saturation = map(hsb[1], 0, 1, 0, 100);
        float brightness = map(hsb[2], 0, 1, 0, 100);

        g[i][j] = color(hue, saturation, brightness);
      }
    }
    return g;
  }

  float C0(float t)
  {
    return -a*t*t*t + a*t*t; //-a*t³ + a*t²
  }

  float C1(float t)
  {
    return -(a + 2.0)*t*t*t + (2.0*a + 3.0)*t*t - a*t; //-(a+2)*t³ + (2*a+3)*t² - a*t
  }

  float C2(float t)
  {
    return (a + 2.0)*t*t*t - (a + 3.0)*t*t + 1.0; //(a+2)*t³ - (a+3)*t² + 1
  }

  float C3(float t)
  {
    return a*t*t*t - 2*a*t*t + a*t; //a*t³ - 2*a*t² + a*t
  }
}
