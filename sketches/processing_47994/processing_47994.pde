
public class discreteDynamicalSystem{
 protected float[] parameters;
 protected int dimension;
 public discreteDynamicalSystem(){
  dimension=0;
  parameters=null;
 }
 public discreteDynamicalSystem(int dimension){
  this.dimension=dimension;
  parameters=null;
 }
 public discreteDynamicalSystem(int dimension, float[] parameters){
  this.dimension=dimension;
  this.parameters=parameters;
 }
 public void setParameters(float[] parameters){
  this.parameters=parameters;
 }
 public float[] getParameters(float[] parameters){
  return parameters;
 }
 public float[] transitionFunction(float[] s){
  return new float[]{0};
 }
 public float[][] orbit(float[] s0, int iterations){
  float[][] o=new float[iterations][dimension];
  for(int i=0;i<iterations;i++){
   float[] t=transitionFunction(s0);
   for(int j=0;j<dimension;j++){
    o[i][j]=t[j];
   }
   s0=transitionFunction(s0);
  } 
  return o;
 }
 public void orbitDiagram(float[][] s0, int orbitIterations, float[] params){
  
 }
 
 public void bifurcationDiagram(float[] s0, int orbitIterations, int numberOfOrbits, float[] params){
  
 }
}

