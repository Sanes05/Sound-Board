import SwiftUI
import AVFoundation

struct ContentView: View {
    let soundFiles = ["Marco Kotzt"] // Namen der Audio-Dateien ohne Dateiendung
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            ForEach(soundFiles, id: \.self) { sound in
                Button(action: {
                    playSound(named: sound)
                }) {
                    Text(sound.capitalized)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
            }
        }
        .padding()
    }

    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file \(soundName) not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
