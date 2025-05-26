enum FromWho { me, hers }

//Entidad atómica, la más pequeña 
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;
  final bool isSeen;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    DateTime? timestamp,
    this.isSeen = false,
  }) : timestamp = timestamp ?? DateTime.now();

  Message copyWith({
    String? text,
    String? imageUrl,
    FromWho? fromWho,
    DateTime? timestamp,
    bool? isSeen,
  }) {
    return Message(
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      fromWho: fromWho ?? this.fromWho,
      timestamp: timestamp ?? this.timestamp,
      isSeen: isSeen ?? this.isSeen,
    );
  }
}
