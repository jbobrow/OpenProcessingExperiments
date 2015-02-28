
size(100,100);
/*
Everything beyond
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;




namespace WindowsFormsApplication2
{

  
    

    public partial class Form1 : Form
    {
       private const UInt32 MOUSEEVENTF_LEFTDOWN = 0x0002;
       private const UInt32 MOUSEEVENTF_LEFTUP = 0x0004;

       public Bitmap ret;
       public int _X=0;
       public int _Y=0;
       private System.Windows.Forms.Panel panel1;
       private System.Windows.Forms.Label label1;
       private System.Windows.Forms.Label label2;
       private System.Windows.Forms.Label label3;
       private System.Windows.Forms.Label label4;
       private System.Windows.Forms.Label label5;
       private System.Windows.Forms.Label label6;
       private System.Windows.Forms.Label label7;
       private System.Windows.Forms.Label label8;
       private System.Windows.Forms.Label label9;
       private System.Windows.Forms.Button clearButton;
       private System.Drawing.Drawing2D.GraphicsPath mousePath;
       private System.Windows.Forms.GroupBox groupBox1;

       private int fontSize = 20;

      // [STAThread]

      

        public Form1()
        {
            //---------------kicker
            PointConverter pc = new PointConverter();

            Point pt = new Point();

            pt = (Point)pc.ConvertFromString("0, 0");

            Cursor.Position = pt;
            //-------------kicker
            pg = new Bitmap(299, 299);
            ret = new Bitmap(299, 299);
            kl = new Bitmap(299, 299);
            for (int x = 0; x < ret.Width; x++)
            {
                for (int y = 0; y < ret.Height; y++)
                {
                    int pos = x+ret.Width*y;
                    Color paw = Color.AliceBlue;
                    ret.SetPixel(x, y, paw);
                    pg.SetPixel(x, y, paw);
                    A[pos] = ret.GetPixel(x, y);
                    B[pos] = pg.GetPixel(x, y);
                }

            }
          //  B = 
             Width = 299;
             Height = 299;
            pg = new Bitmap(299, 299);
            asize = Width * Height;
            rainfall = 1;
            step = false;
           initmaps();
            show = false;
            int R1 = 0;
            int R2 = 0;
            int R3 = 0;
            int R4 = 0;
            int R5 = 0;
            Random random = new Random();
            for (int i = 0; i < 3; i++)

            {
                R1 = random.Next(0, 40);
                R2 = random.Next(0, 40);
                R3 = random.Next(0, 40);
                R4 = random.Next(0, 40);
                R5 = random.Next(0, 40);
                cc[i] = R1 + R2 + R3 + R4 + R5;
               // Color k =  cc[i];
              //Console.Writeln(k.ToString());
            }

            InitializeComponent();
            mousePath = new System.Drawing.Drawing2D.GraphicsPath();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.clearButton = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();

            // Mouse Events Label
            this.label1.Location = new System.Drawing.Point(24, 504);
            this.label1.Size = new System.Drawing.Size(392, 23);
            // DoubleClickSize Label
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 48);
            this.label2.Size = new System.Drawing.Size(35, 13);
            // DoubleClickTime Label
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 72);
            this.label3.Size = new System.Drawing.Size(35, 13);
            // MousePresent Label
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(24, 96);
            this.label4.Size = new System.Drawing.Size(35, 13);
            // MouseButtons Label
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(24, 120);
            this.label5.Size = new System.Drawing.Size(35, 13);
            // MouseButtonsSwapped Label
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(320, 48);
            this.label6.Size = new System.Drawing.Size(35, 13);
            // MouseWheelPresent Label
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(320, 72);
            this.label7.Size = new System.Drawing.Size(35, 13);
            // MouseWheelScrollLines Label
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(320, 96);
            this.label8.Size = new System.Drawing.Size(35, 13);
            // NativeMouseWheelSupport Label
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(320, 120);
            this.label9.Size = new System.Drawing.Size(35, 13);


            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                            | System.Windows.Forms.AnchorStyles.Right);
            this.panel1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel1.Location = new System.Drawing.Point(16, 160);
            this.panel1.Size = new System.Drawing.Size(664, 320);
            this.panel1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.panel1_MouseUp);
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
            this.panel1.MouseEnter += new System.EventHandler(this.panel1_MouseEnter);
            this.panel1.MouseHover += new System.EventHandler(this.panel1_MouseHover);
            this.panel1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.panel1_MouseMove);
            this.panel1.MouseLeave += new System.EventHandler(this.panel1_MouseLeave);
            this.panel1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.panel1_MouseDown);
            this.panel1.MouseWheel += new System.Windows.Forms.MouseEventHandler(this.panel1_MouseWheel);

            // Clear Button
            this.clearButton.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
            this.clearButton.Location = new System.Drawing.Point(592, 504);
            this.clearButton.TabIndex = 1;
            this.clearButton.Text = "Clear";
            this.clearButton.Click += new System.EventHandler(this.clearButton_Click);

            // GroupBox
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                | System.Windows.Forms.AnchorStyles.Right);
            this.groupBox1.Location = new System.Drawing.Point(16, 24);
            this.groupBox1.Size = new System.Drawing.Size(664, 128);
            this.groupBox1.Text = "System.Windows.Forms.SystemInformation";

           // InitializeComponent();

            // Set up how the form should be displayed and add the controls to the form.
            this.ClientSize = new System.Drawing.Size(696, 534);
            this.Controls.AddRange(new System.Windows.Forms.Control[] {
                                        this.label9,this.label8,this.label7,this.label6,
                                        this.label5,this.label4,this.label3,this.label2,
                                        this.clearButton,this.panel1,this.label1,this.groupBox1});
            this.Text = "Mouse Event Example";

            // Displays information about the system mouse.
            int kx = Cursor.Position.X;
            int ky = Cursor.Position.Y;
            label2.Text = "X =  " + kx + "  Y = " + ky;
                //"SystemInformation.DoubleClickSize: " + SystemInformation.DoubleClickSize.ToString();
            label3.Text = "SystemInformation.DoubleClickTime: " + SystemInformation.DoubleClickTime.ToString();
            label4.Text = "SystemInformation.MousePresent: " + SystemInformation.MousePresent.ToString();
            label5.Text = "SystemInformation.MouseButtons: " + SystemInformation.MouseButtons.ToString();
            label6.Text = "SystemInformation.MouseButtonsSwapped: " + SystemInformation.MouseButtonsSwapped.ToString();
            label7.Text = "SystemInformation.MouseWheelPresent: " + SystemInformation.MouseWheelPresent.ToString();
            label8.Text = "SystemInformation.MouseWheelScrollLines: " + SystemInformation.MouseWheelScrollLines.ToString();
            label9.Text = "SystemInformation.NativeMouseWheelSupport: " + SystemInformation.NativeMouseWheelSupport.ToString();


            
            // Bitmap ret = new Bitmap(299, 299);

            for (int x = 0; x < Width; x++)
            {
                for (int y = 0; y < Height; y++)
                {

                    Color xx = ret.GetPixel(x, y);
                    //  xx = Color.DarkBlue;
                    int _x = kx;
                    int _y = ky;
                    if (x > 255) _x = 255;
                    if (y > 255) _y = 255;
                    if (x < 0) _x = 0;
                    if (y < 0) _y = 0;
                      xx = Color.FromArgb(_X, _Y, _X);
                    //  xx= System.Drawing.Pens.DarkBlue;
                    //xx= this.pictureBox1.Image.GetPix
                    ret.SetPixel(x, y, xx);
                    // ret.SetPixel(x, y, Color.FromARGB(255, 0, 0));

                }
            }

            this.pictureBox1.Image = ret;

        }

        private void initmaps()
        {
            map1 = new int[asize];
            map2 = new int[asize];
        }

        private void updatemap()
        {
            int x, y, yw, i;

            for (y = 1; y < Height - 1; y++)
            {
                yw = y * Width;
                for (x = 1; x < Width - 1; x++)
                {
                    i = x + yw;
                    mapOut[i] = ((mapIn[i - 1] + mapIn[i + 1] + mapIn[i + Width] + mapIn[i - Width]) >> 1) - mapOut[i];
                    mapOut[i] -= mapOut[i] >> 8;
                }
            }
        }


        private void rendermap()
        {
            int o, p, i, x, y, xo, yo, r, g, b, shade;

          //  Color [] pix = new Color[299 * 299];
           // for (int ix = 0;ix < 299 * 299; ix++)
           // {
            //    pix[ix] = A[ix];
         //   }
            Color [] pix = B;
            i = 0;

            for (y = 0; y < Height; y++)
            {
                for (x = 0; x < Width; x++)
                {
                    if (x == 0)
                    {
                        xo = mapOut[i] - mapOut[i + 1];
                    }
                    else if (x == Width - 1)
                    {
                        xo = mapOut[i - 1] - mapOut[i];
                    }
                    else
                    {
                        xo = mapOut[i - 1] - mapOut[i + 1];
                    }
                    if (y == 0)
                    {
                        yo = mapOut[i] - mapOut[i + Width];
                    }
                    else if (y == Height - 1)
                    {
                        yo = mapOut[i - Width] - mapOut[i];
                    }
                    else
                    {
                        yo = mapOut[i -Width] - mapOut[i + Width];
                    }
                    //shade=(xo+yo)>>2;
                    xo += x;
                    yo += y;
                    while (xo < 0) xo += Width;
                    while (yo < 0) yo += Height;
                    while (xo >= Width) xo -= Width;
                    while (yo >= Height) yo -= Height;

                    /*
                    // Additional Shading
                    p=pix[xo+yo*width];
                    r=(p&0xff0000;)>>16;
                    g=(p&0x00ff00;)>>8;
                    b=(p&0x0000ff;);
                    r+=shade;
                    g+=shade;
                    b+=shade;
                    if (r<0) r=0;
                    if (r>255) r=255;
                    if (g<0) g=0;
                    if (g>255) g=255;
                    if (b<0) b=0;
                    if (b>255) b=255;
                    pixels[i++]=0xff000000 | r<<16 | g<<8 | b;
                    */
                   // if (keyPressed && key == 'l')
                  //  {

                    //    A[i++] = pix[xo + yo * width];
                 //   }
                  //  else
                  //  {
                    int ppa = i++;
                        B[ppa] = pix[xo + yo * Width];
                    int oy = Convert.ToInt32(ppa/Width);
                    int ox = ppa-(oy*Width);
                    pg.SetPixel(ox,oy,pix[xo + yo * Width]);
                      //  ret.SetPixel(x, y, pix[xo + yo * Width]);
                   // }
                }
            }

        }

        private void fastblur(){
  int w=Width;
  int h=Height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=3;
  int [] r= new int[wh];
   
  int sum,x,y,i,p,p1,p2,yp,yi,yw;
  int [] vmin = new int[299];
  int [] vmax = new int[299];
 
  yw=yi=0;
 
  for (y=0;y<h;y++){
    sum=0;
    for(i=-1;i<=1;i++){
      p=mapOut[yi+Math.Min(wm,Math.Max(i,0))];
      sum+= p;
    }
    for (x=0;x<w;x++){
 
      r[yi]=sum/div;
 
      if(y==0){
        vmin[x]=Math.Min(x+2,wm);
        vmax[x]=Math.Max(x-1,0);
      }
      p1=mapOut[yw+vmin[x]];
      p2=mapOut[yw+vmax[x]];
 
      sum+= p1 -p2 ;
      yi++;
    }
    yw+=w;
  }
 
  for (x=0;x<w;x++){
    sum=0;
    yp=-w;
    for(i=-1;i<=1;i++){
      yi=Math.Max(0,yp)+x;
      sum+=r[yi];
 
      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
      mapOut[yi]=sum/div;
      if(x==0){
        vmin[y]=Math.Min(y+2,hm)*w;
        vmax[y]=Math.Max(y-1,0)*w;
      }
      p1=x+vmin[y];
      p2=x+vmax[y];
 
      sum+=r[p1]-r[p2];
 
      yi+=w;
    }
  }
 
}

        private void rain2(){
  //mapIn[int(random(asize-1))]+=int(random(-strength,strength));
            Random rnd = new Random();
            int R1 = rnd.Next(-strength,strength);
  mapIn[_X+_Y*Width]+=R1;
 // mapIn[mouseX+mouseY*width]+=mouseX+mouseY*width/8;
}
        private void rain3(){
             Random rnd = new Random();
             Random rnd2 = new Random();
            int R1 = rnd.Next(-strength,strength);
            int R2 = rnd.Next(0,asize-1);
  mapIn[R2]+=R1;
 // mapIn[mouseX+mouseY*width]+=int(random(-strength,strength));
 // mapIn[mouseX+mouseY*width]+=mouseX+mouseY*width/8;
}


        private void pool()
        {

            /*
            if (keyPressed == true && key == 'v')
            {

                if (!step)
                {
                    mapIn = map2;
                    mapOut = map1;
                }
                else
                {
                    mapOut = map2;
                    mapIn = map1;
                }

            }

            if (keyPressed == true && key == 'f')
            {

                if (!step)
                {
                    mapIn = map2;
                    mapOut = map1;
                }
                else
                {
                    mapOut = map1;
                    mapIn = map2;
                }



            }
            */

           // if (keyPressed == false)
           // {
                if (!step)
                {
                    mapIn = map1;
                    mapOut = map2;
                }
                else
                {
                    mapOut = map1;
                    mapIn = map2;
                }
          //  }

            rain();
            updatemap();
            fastblur();
          //  if (show)
          //  {
          //      showmap();
         //   }
         //   else
         //   {
                rendermap();
            //}
            step = !step;
            Console.WriteLine("-");
        }

        private void rain()
        {
            //mapIn[int(random(asize-1))]+=int(random(-strength,strength));
            //mapIn[mouseX+mouseY*width]+=int(random(-strength,strength));
           // if (_Y > 2 && _Y < Height - 2)
           // {
                mapIn[_X + _Y * Width] += _X + _Y * Width / by;
                //Console.WriteLine("-");
           // }
        }
        private void panel1_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
        {
            // Update the mouse path with the mouse information
            Point mouseDownLocation = new Point(e.X, e.Y);

            string eventString = null;
            switch (e.Button)
            {
                case MouseButtons.Left:
                    eventString = "L";
                    break;
                case MouseButtons.Right:
                    eventString = "R";
                    break;
                case MouseButtons.Middle:
                    eventString = "M";
                    break;
                case MouseButtons.XButton1:
                    eventString = "X1";
                    break;
                case MouseButtons.XButton2:
                    eventString = "X2";
                    break;
                case MouseButtons.None:
                default:
                    break;
            }

            if (eventString != null)
            {
                mousePath.AddString(eventString, FontFamily.GenericSerif, (int)FontStyle.Bold, fontSize, mouseDownLocation, StringFormat.GenericDefault);
            }
            else
            {
                mousePath.AddLine(mouseDownLocation, mouseDownLocation);
            }
            panel1.Focus();
            panel1.Invalidate();
        }

        private void panel1_MouseEnter(object sender, System.EventArgs e)
        {
            // Update the mouse event label to indicate the MouseEnter event occurred.
            label1.Text = sender.GetType().ToString() + ": MouseEnter";
        }

        private void panel1_MouseHover(object sender, System.EventArgs e)
        {
            // Update the mouse event label to indicate the MouseHover event occurred.
            label1.Text = sender.GetType().ToString() + ": MouseHover";
           
        }

        private void panel1_MouseLeave(object sender, System.EventArgs e)
        {
            // Update the mouse event label to indicate the MouseLeave event occurred.
            label1.Text = sender.GetType().ToString() + ": MouseLeave";
        }

        private void panel1_MouseMove(object sender, System.Windows.Forms.MouseEventArgs e)
        {
            // Update the mouse path that is drawn onto the Panel.
            int mouseX = e.X;
            int mouseY = e.Y;

            mousePath.AddLine(mouseX, mouseY, mouseX, mouseY);
            int kx = Cursor.Position.X;
            int ky = Cursor.Position.Y;
           // label2.Text = "X =  " + kx + "  Y = " + ky;
            _X = kx-391;
            _Y = ky-265;
            if (_X > 255) _X = 255;
            if (_Y > 255) _Y = 255;
            if (_X < 0) _X = 0;
            if (_Y < 0) _Y = 0;

            label2.Text = "X =  " + _X + "  Y = " + _Y;
            /*
           int Width = 29;
          int Height = 29;
          // Bitmap ret = new Bitmap(299, 299);
            
            for (int x = 0; x < Width; x++)
            {
                for (int y = 0; y < Height; y++)
                {

                    Color xx = ret.GetPixel(x, y);
                    //  xx = Color.DarkBlue;
                    int _x = kx;
                    int _y = ky;
                    if (x > 255) _x = 255;
                    if (y > 255) _y = 255;
                    if (x < 0) _x = 0;
                    if (y < 0) _y = 0;
                  //  xx = Color.FromArgb(_x, _y, _x);
                    //  xx= System.Drawing.Pens.DarkBlue;
                    //xx= this.pictureBox1.Image.GetPix
                    ret.SetPixel(x, y, xx);
                    // ret.SetPixel(x, y, Color.FromARGB(255, 0, 0));

                }
            }

            this.pictureBox1.Image = ret;
            */
          //  e.Graphics.DrawPath(System.Drawing.Pens.DarkBlue, mousePath);
        }

        private void panel1_MouseWheel(object sender, System.Windows.Forms.MouseEventArgs e)
        {
            // Update the drawing based upon the mouse wheel scrolling.

            int numberOfTextLinesToMove = e.Delta * SystemInformation.MouseWheelScrollLines / 120;
            int numberOfPixelsToMove = numberOfTextLinesToMove * fontSize;

            if (numberOfPixelsToMove != 0)
            {
                System.Drawing.Drawing2D.Matrix translateMatrix = new System.Drawing.Drawing2D.Matrix();
                translateMatrix.Translate(0, numberOfPixelsToMove);
                mousePath.Transform(translateMatrix);
            }
            panel1.Invalidate();
        }
        private void panel1_MouseUp(object sender, System.Windows.Forms.MouseEventArgs e)
        {
            Point mouseUpLocation = new System.Drawing.Point(e.X, e.Y);

            // Show the number of clicks in the path graphic.
            int numberOfClicks = e.Clicks;
            mousePath.AddString("    " + numberOfClicks.ToString(),
                        FontFamily.GenericSerif, (int)FontStyle.Bold,
                        fontSize, mouseUpLocation, StringFormat.GenericDefault);

            panel1.Invalidate();
        }

        private void panel1_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
        {
            // Perform the painting of the Panel.
            e.Graphics.DrawPath(System.Drawing.Pens.DarkBlue, mousePath);
        }

        private void clearButton_Click(object sender, System.EventArgs e)
        {
            // Clear the Panel display.
            mousePath.Dispose();
            mousePath = new System.Drawing.Drawing2D.GraphicsPath();
            panel1.Invalidate();
        }


   

        private void Form1_Load(object sender, EventArgs e)
        {
            
    
        }

        public static void GrayScaleImage(Bitmap image)
        {
            int Width = image.Width;
            int Height = image.Height;
           // var data = image.LockBits(new Rectangle(0, 0, image.Width, image.Height), ImageLockMode.ReadWrite, image.PixelFormat);
            for (int x = 0; x < Width; x++)
            {
                for (int y = 0; y < Height; y++)
                {
                   // image.SetPixel(x, y, x);
                   // System.Drawing.Bitmap.SetPixel(1, 1, 1);

                }
            }
        }


       
        private void button1_Click(object sender, EventArgs e)
        {

          int Width =  this.pictureBox1.Width;
             int Height = this.pictureBox1.Height;
           //  Bitmap ret = new Bitmap(Width, Height, PixelFormat.Format24bppRgb);
             Bitmap ret = new Bitmap(Width, Height);

             //BitmapData bmpData = ret.LockBits(new Rectangle(0, 0, Width, Height), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);

            for (int x = 0; x < Width; x++)
            {
                for (int y = 0; y < Height; y++)
                {

                    Color xx = ret.GetPixel(x, y);
                    //  xx = Color.DarkBlue;
                    int _x = x;
                    int _y = y;
                    if (x > 255) _x = 255;
                    if (y > 255) _y = 255;
                    xx = Color.FromArgb(_x, _y,_x);
                  //  xx= System.Drawing.Pens.DarkBlue;
                    //xx= this.pictureBox1.Image.GetPix
                    ret.SetPixel(x, y, xx);
                   // ret.SetPixel(x, y, Color.FromARGB(255, 0, 0));
                    
                }
            }
            
           this.pictureBox1.Image = ret;
            /*
             int Width = ProcessedBitmap.Width;
                int Height = ProcessedBitmap.Height;
                 for (int x = 0; x < Width; x++)
                    {
                        for (int y = 0; y < Height; y++)
                        {
                            Color CurrentPixel = ProcessedBitmap.GetPixel(x, y);
                            // Clipping new RGB values to 255:
                            int NewR = ((CurrentPixel.R + RedMagnitudeToAdd > 255) ? 255 : CurrentPixel.R + RedMagnitudeToAdd);
                            int NewG = ((CurrentPixel.G + GreenMagnitudeToAdd > 255) ? 255 : CurrentPixel.G + GreenMagnitudeToAdd);
                            int NewB = ((CurrentPixel.B + BlueMagnitudeToAdd > 255) ? 255 : CurrentPixel.B + BlueMagnitudeToAdd);
                            Color NewPixel = Color.FromArgb(NewR, NewG, NewB);
                            ProcessedBitmap.SetPixel(x, y, NewPixel);
                        }
                    }
            */
        }
        /*
        static float dist(float x1, float y1, float x2, float y2)
        {

            float retval = 0.0;

            return retval;
        }
     */

        static int ABS(int a, int b)
        {

            int retval = 0;

            retval = a - b;
            if (retval < 0) retval = retval * -1;
            if (retval > 255) retval = 255;

            return retval;
        }

        static double dist(double x1, double y1, double x2, double y2)
        {
            // This method returns a constant float.
            double retval;

            retval = Math.Pow((x1 - x2), 2)+ Math.Pow((y1 - y2),2);
            
         //   retval = 0d;
            return retval;

        }

        static double dist2(double x1, double y1, double x2, double y2)
        {
            double retval ;
            double _A = x1-x2;
            if(_A<0) _A=_A*-1;
            double _B = y1-y2;
            if(_B<0) _B=_B*-1;
            retval = 0d;
           retval = _A + _B;

            return retval;
        }
//-----------------------
        /*
         water code
        
        */
//-------------
        public bool dowater = true;
        public int cmode = 1;
        int[] map1;
        int[] map2;
        int[] mapIn;
        int[] mapOut;
        int asize;
        bool step;
        int rainfall;
        bool show;
        int strength = 8000;

        //----
        int numBlobs = 3;
        public int by = 5;//8
        int[] blogPx = { 0, 90, 90 };
        int[] blogPy = { 0, 120, 45 };
        Bitmap pg;
        int[][] vy, vx;


        int cm = 1;

        int c = 1;
        int kx, ky, ka;
        public int Width;
        public int Height;

        public Color[] A = new Color [299*299];
        public Color[] B = new Color[299 * 299];
        double rr, gg, bb, dis;
        int gain = 5;
        int [] cc = new int[3];

        // Movement vector for each blob
        int[] blogDx = { 1, 1, 1 };
        int[] blogDy = { 1, 1, 1 };
        Bitmap kl;
        public int lmode = 1;

        private void timer1_Tick(object sender, EventArgs e)
        { //MAIN DRAW
            
            // Bitmap ret = new Bitmap(299, 299);
            c++;



            if (c == 80)
            {
                c = 0;
            }

            ky = 0;
            kx = 0;

            for (int y = 0; y < Height; y+=1)
            {
                for (int x = 0; x < Width; x+=1)
                {
                    kx += 1;
                   int pos=y*Width+x;
                   int ka = ky * Width + kx;
                  // Color col = pg.GetPixel(x,y);
                   Color xx = pg.GetPixel(x, y);
                  double dd = dist(x, y, _X, _Y);
                  rr = xx.R;
                  gg = xx.G;
                  bb = xx.B;
                  if (lmode == 1) dis = dist2(_X, _Y, x, y) / by;
                  if (lmode == 2) dis = dist2(_X, _Y, _X, y) / by;
                  rr += cc[0] / dis - gain;
                  gg += cc[1] / dis - gain;
                  bb += cc[2] / dis - gain;

                    int _d = Convert.ToInt32(dd);
                    if (_d < 0) _d = 0;
                    if (_d > 255) _d = 255;
                    if (_X< 0) _d = 0;
                    if (_X > 255) _d = 255;

                    if (_Y < 0) _d = 0;
                    if (_Y > 255) _d = 255;

                 // xx = Color.FromArgb(ABS(_X,_d), 0, 0);
  /*
                    //  xx = Color.DarkBlue;
                    int _x = kx;
                    int _y = ky;
                    if (x > 255) _x = 255;
                    if (y > 255) _y = 255;
                    if (x < 0) _x = 0;
                    if (y < 0) _y = 0;
                   
                    //  xx= System.Drawing.Pens.DarkBlue;
                    //xx= this.pictureBox1.Image.GetPix
                  //  ret.SetPixel(x, y, xx);
                    // ret.SetPixel(x, y, Color.FromARGB(255, 0, 0));
*/
                  int m = 1;
                  if (rr < 0) rr = 0;
                  if (gg < 0) gg = 0;
                  if (bb < 0) bb = 0;
                  if (rr > 255) rr = 255;
                  if (gg     > 255) gg = 255;
                  if (bb > 255) bb = 255;
                  int _rr = Convert.ToInt32(rr);

                  int _gg = Convert.ToInt32(gg);
                  int _bb = Convert.ToInt32(bb);
                  xx = Color.FromArgb(_rr, _gg,_bb);
                 pg.SetPixel(x,y,xx);
               //  pg.SetPixel(x, y, xx);
                }
                kx=0;
                ky+=1;
            }

           // if (dowater) 
              //  pool();
            this.pictureBox1.Image = pg;
            //TIMER
        } //TIMER
        
    }
}

*/
