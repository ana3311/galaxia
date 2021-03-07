class Sol{
  
  private ArrayList<Planeta> planetas;
  private PShape sol_shape;
  private PImage textura_sol;
  private float x, y, z, radio, angulo, velocidad;
  
  Sol(float x, float y, float z, float radio){
    this.planetas = new ArrayList<Planeta>();
    this.x = x;
    this.y = y;
    this.z = z;
    this.radio = radio;
    this.sol_shape = createShape(SPHERE, this.radio);
    this.textura_sol = loadImage("imagenes/sol.jpg");
    this.sol_shape.setTexture(textura_sol);
    this.sol_shape.setStroke(0);
    this.angulo = 0;
    this.velocidad = 0.5;
  }
  
  void mostrar_todo(){
    translate(x, y, z);
    rotateX(radians(-45));
    pushMatrix();
    rotateY(radians(angulo));
    shape(sol_shape);
    popMatrix();
    
    for (Planeta planeta : planetas) {
      pushMatrix();
      planeta.mostrar_planeta();
      popMatrix();
      planeta.actualizar_posicion();
    }
  }
  
  void add_planeta(Planeta planeta){
    planetas.add(planeta);
  }
  
  void actualizar_posicion(){
    angulo += velocidad;
    if(angulo >=360) angulo = 0;
  }
}
