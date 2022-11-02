import processing.video.*; 

Movie movie;

void setup(){
  size (720, 748);
  movie = new Movie(this, "sunset.mp4");
  movie.loop();
}
   
void movieEvent(Movie movie){
  movie.read();  
}

void draw() {
 
 float ms = map (mouseX, 0, width, 0, 2);
 movie.speed(ms);
 image(movie, 0, 0);  
 
}
