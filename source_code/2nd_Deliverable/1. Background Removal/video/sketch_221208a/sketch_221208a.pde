import processing.video.*;

Capture video;


PImage backgroundImage;

Movie backgroundReplace;


float threshold = 20;

void setup() {
  size(1280, 720);
  video = new Capture(this, width, height, 30);
  video.start();

 
  backgroundImage = createImage(video.width, video.height, RGB);
  backgroundReplace = new Movie(this, "stars.mp4");
  backgroundReplace.loop();
}


void captureEvent(Capture video) {
  video.read();
}

void movieEvent(Movie mybackgroundReplace) {
  mybackgroundReplace.read();
}


void draw() {
  
  threshold = map(mouseX, 0, width, 5, 50);

  image(backgroundReplace, 0, 0, width, height);

  loadPixels();
  video.loadPixels(); 
  backgroundReplace.loadPixels();

  
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width; 
      color fgColor = video.pixels[loc]; 

      
      color bgColor = backgroundImage.pixels[loc];

      
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) {
        
        pixels[loc] = fgColor;
      } else {
        

        pixels[loc] = backgroundReplace.pixels[loc];
      }
    }
  }
  updatePixels();
}

void mousePressed() {
  backgroundImage.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
  backgroundImage.updatePixels();
}
