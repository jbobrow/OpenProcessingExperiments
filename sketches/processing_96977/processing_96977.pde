


public interface Derivatives {
    public void derivs( double t0, double[] X, double[] dX );
}

void G_acceleartion( double[] X, double [] as ){
 double x = X[0]; double y = X[1]; double z = X[2];
 double r2 = x*x+y*y+z*z;
 double r  = Math.sqrt(r2);
 double aa  = -1.0d/ (r2*r);
 as[0]=x*aa; as[1]=y*aa; as[2]=z*aa; 
}

double [] as = new double[3]; 

class EulerVelPos3D implements Derivatives {
public void derivs(  double t, double[] X, double[] dX ){
  G_acceleartion(X,as);
  dX[0]= X[3];  dX[1]= X[4];  dX[2]= X[5];   // update positions 
  dX[3]=as[0];  dX[4]=as[1];  dX[5]=as[2];   // update forces
}
}






