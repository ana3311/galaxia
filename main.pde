Sol sol;
String marte_ruta;
PImage universo;
String universo_ruta;
int radio_sol;

void setup(){
  size(1366, 768, P3D);
  universo_ruta = "imagenes/universo.jpg";
  universo = loadImage(universo_ruta);
  radio_sol = 75;
  sol = new Sol(width/2, height/2, 0, 75);
  sol.add_planeta(new Planeta(radio_sol + 15, height/2 - radio_sol*3, 0, 10, "imagenes/marte.jpg", "Marte", false));
  sol.add_planeta(new Planeta(radio_sol + 100, height/2 - radio_sol*2, 0, 15, "imagenes/rocoso.jpg", "Rocoso", false));
  sol.add_planeta(new Planeta(radio_sol + 160, height/2 - radio_sol*2, 0, 30, "imagenes/saturno.jpg", "Saturno", false));
  sol.add_planeta(new Planeta(radio_sol + 300, height/2 - radio_sol*3, 0, 30, "imagenes/tatooine.jpg", "Tatooine", true));
  sol.add_planeta(new Planeta(radio_sol + 460, height/2 - radio_sol*4, 0, 25, "imagenes/frondoso.jpg", "Frondoso", true));
}

void draw(){
  background(universo);
  sol.mostrar_todo();
  sol.actualizar_posicion();
  
  //saveFrame ("gif/fotograma−###.png");
}
