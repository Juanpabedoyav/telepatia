class VoiceState {
  final bool isRecording;
  final bool isUploading;
  final bool isPlaying;
  final double uploadProgress;
  final String? filePath;
  final String? audioUrl;
  final String? downloadUrl;
  final List<String> audioFilesList;
  final String? currentPlayingUrl;

  const VoiceState({
    required this.isRecording,
    required this.isUploading,
    required this.isPlaying,
    required this.uploadProgress,
    this.filePath,
    this.audioUrl,
    this.downloadUrl,
    required this.audioFilesList,
    this.currentPlayingUrl,
  });

  factory VoiceState.initial() => const VoiceState(
        isRecording: false,
        isUploading: false,
        isPlaying: false,
        uploadProgress: 0.0,
        filePath: null,
        audioUrl: null,
        downloadUrl: null,
        audioFilesList: [],
        currentPlayingUrl: null,
      );

  VoiceState copyWith({
    bool? isRecording,
    bool? isUploading,
    bool? isPlaying,
    double? uploadProgress,
    String? filePath,
    String? audioUrl,
    String? downloadUrl,
    List<String>? audioFilesList,
    String? currentPlayingUrl,
  }) {
    return VoiceState(
      isRecording: isRecording ?? this.isRecording,
      isUploading: isUploading ?? this.isUploading,
      isPlaying: isPlaying ?? this.isPlaying,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      filePath: filePath ?? this.filePath,
      audioUrl: audioUrl ?? this.audioUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      audioFilesList: audioFilesList ?? this.audioFilesList,
      currentPlayingUrl: currentPlayingUrl ?? this.currentPlayingUrl,
    );
  }
}
