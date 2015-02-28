
/*
BEAL'S CONJECTURE: http://www.bealconjecture.com
If A^x + B^y = C^z, where A, B, C, x, y and z are positive integers
and x, y and z are all greater than 2,
then A, B and C must have a common prime factor.
----------------------------------
I wrote following program, which found no solutions.
----------------------------------
However, Beal-Cook Conjecture: if A^x + B^y - 1 = C^z then x,y,z=3
 A  B  C x y z A^x  B^y  sum  C^z
10 9 12 3 3 3 1000 729 1729 1728
94 64 103 3 3 3 830584 262144 1092728 1092727
144 73 150 3 3 3 2985984 389017 3375001 3375000
235 135 249 3 3 3 12977875 2460375 15438250 15438249
438 334 495 3 3 3 84027672 37259704 121287376 121287375
729 244 738 3 3 3 387420489 14526784 401947273 401947272
1537 368 1544 3 3 3 3630961153 49836032 3680797185 3680797184
1738 1033 1852 3 3 3 5249879272 1102302937 6352182209 6352182208
1897 1010 1988 3 3 3 6826561273 1030301000 7856862273 7856862272
2304 577 2316 3 3 3 12230590464 192100033 12422690497 12422690496
3518 3097 4184 3 3 3 43539907832 29704593673 73244501505 73244501504
4528 3753 5262 3 3 3 92836605952 52861038777 145697644729 145697644728
5625 1126 5640 3 3 3 177978515625 1427628376 179406144001 179406144000
8343 4083 8657 3 3 3 580719929607 68067239787 648787169394 648787169393
9036 5856 9791 3 3 3 737783038656 200818262016 938601300672 938601300671
9735 3987 9953 3 3 3 922588140375 63378025803 985966166178 985966166177
*/
long a=2, b=2, c=100;
void setup() {
    size(600,800);
    /*for (long a=2; a<10000; a++) {
      for (long b=2; b<=a; b++) {
        for (long c=a; c<1000000; c++) {
          if (c*c>(a*a+b*b)) break;
          test(a,b,c);
        }
      }
    }*/
  }
  void draw() {
    step(10000);
  }
  void step(int n) {
    while (n-->0) {
    if (c*c > (a*a+b*b)) {
      if (b > a) {
        a++; b=2;
      } else b++;
      c=a;
    } else c++;
    if (a%100==0) {
      fill(0);
      rect(width-40,0,width,30);
      fill(-1);
      text(""+a,width-40,20);
    }
    test(a,b,c);
    }
  }
  int pos=20;
  long min=Long.MAX_VALUE;
  void test(long a, long b, long c) {
    long m=a*a;
    for (long x=3; x<4; x++) {
      m*=a;
      if (m<=0) break;
      long n=b*b;
      for (int y=3; y<4; y++) {
        n*=b;
        if (n<=0) break;
        long i=m+n;
        if (i<=0) break;
        long k=c*c*c; int p=3;
        if (k>i) break;
        while(k>0 && k<=i && i%k == 0) {k*=c; p++;}
        if (k>0 && k<=i && i-k <= min) {
          text(a+" "+b+" "+c+" "+x+" "+y+" "+p+" "+m+" "+n+" "+i+" "+k,10,pos);
          min = i-k;  pos+=20;
        }
      }
    }
  }

