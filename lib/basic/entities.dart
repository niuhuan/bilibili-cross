import 'package:flutter/material.dart';

class BvInfo {
  BvInfo({
    required this.bvid,
    required this.aid,
    required this.videos,
    required this.tid,
    required this.copyright,
    required this.pic,
    required this.title,
    required this.ctime,
    required this.desc,
    required this.descV2,
    required this.state,
    required this.duration,
    required this.videoDynamic,
    required this.cid,
    required this.dimension,
    required this.noCache,
    required this.pages,
  });
  late final String bvid;
  late final int aid;
  late final int videos;
  late final int tid;
  late final int copyright;
  late final String pic;
  late final String title;
  late final int ctime;
  late final String desc;
  late final List<DescV2> descV2;
  late final int state;
  late final int duration;
  late final String videoDynamic;
  late final int cid;
  late final Dimension dimension;
  late final bool noCache;
  late final List<Pages> pages;

  BvInfo.fromJson(Map<String, dynamic> json){
    bvid = json['bvid'];
    aid = json['aid'];
    videos = json['videos'];
    tid = json['tid'];
    copyright = json['copyright'];
    pic = json['pic'];
    title = json['title'];
    ctime = json['ctime'];
    desc = json['desc'];
    descV2 = List.from(json['desc_v2']).map((e)=>DescV2.fromJson(e)).toList();
    state = json['state'];
    duration = json['duration'];
    videoDynamic = json['dynamic'];
    cid = json['cid'];
    dimension = Dimension.fromJson(json['dimension']);
    noCache = json['no_cache'];
    pages = List.from(json['pages']).map((e)=>Pages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bvid'] = bvid;
    _data['aid'] = aid;
    _data['videos'] = videos;
    _data['tid'] = tid;
    _data['copyright'] = copyright;
    _data['pic'] = pic;
    _data['title'] = title;
    _data['ctime'] = ctime;
    _data['desc'] = desc;
    _data['desc_v2'] = descV2.map((e)=>e.toJson()).toList();
    _data['state'] = state;
    _data['duration'] = duration;
    _data['dynamic'] = videoDynamic;
    _data['cid'] = cid;
    _data['dimension'] = dimension.toJson();
    _data['no_cache'] = noCache;
    _data['pages'] = pages.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DescV2 {
  DescV2({
    required this.rawText,
    required this.type,
    required this.bizId,
    required this.rights,
    required this.owner,
    required this.stat,
  });
  late final String rawText;
  late final int type;
  late final int bizId;
  late final Rights rights;
  late final Owner owner;
  late final Stat stat;

  DescV2.fromJson(Map<String, dynamic> json){
    rawText = json['raw_text'];
    type = json['type'];
    bizId = json['biz_id'];
    rights = Rights.fromJson(json['rights']);
    owner = Owner.fromJson(json['owner']);
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['raw_text'] = rawText;
    _data['type'] = type;
    _data['biz_id'] = bizId;
    _data['rights'] = rights.toJson();
    _data['owner'] = owner.toJson();
    _data['stat'] = stat.toJson();
    return _data;
  }
}

class Rights {
  Rights({
    required this.bp,
    required this.elec,
    required this.download,
    required this.movie,
    required this.pay,
    required this.hd5,
    required this.noReprint,
    required this.autoplay,
    required this.ugcPay,
    required this.isCooperation,
    required this.ugcPayPreview,
    required this.noBackground,
    required this.cleanMode,
    required this.isSteinGate,
    required this.is_360,
    required this.noShare,
  });
  late final int bp;
  late final int elec;
  late final int download;
  late final int movie;
  late final int pay;
  late final int hd5;
  late final int noReprint;
  late final int autoplay;
  late final int ugcPay;
  late final int isCooperation;
  late final int ugcPayPreview;
  late final int noBackground;
  late final int cleanMode;
  late final int isSteinGate;
  late final int is_360;
  late final int noShare;

  Rights.fromJson(Map<String, dynamic> json){
    bp = json['bp'];
    elec = json['elec'];
    download = json['download'];
    movie = json['movie'];
    pay = json['pay'];
    hd5 = json['hd5'];
    noReprint = json['no_reprint'];
    autoplay = json['autoplay'];
    ugcPay = json['ugc_pay'];
    isCooperation = json['is_cooperation'];
    ugcPayPreview = json['ugc_pay_preview'];
    noBackground = json['no_background'];
    cleanMode = json['clean_mode'];
    isSteinGate = json['is_stein_gate'];
    is_360 = json['is_360'];
    noShare = json['no_share'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bp'] = bp;
    _data['elec'] = elec;
    _data['download'] = download;
    _data['movie'] = movie;
    _data['pay'] = pay;
    _data['hd5'] = hd5;
    _data['no_reprint'] = noReprint;
    _data['autoplay'] = autoplay;
    _data['ugc_pay'] = ugcPay;
    _data['is_cooperation'] = isCooperation;
    _data['ugc_pay_preview'] = ugcPayPreview;
    _data['no_background'] = noBackground;
    _data['clean_mode'] = cleanMode;
    _data['is_stein_gate'] = isSteinGate;
    _data['is_360'] = is_360;
    _data['no_share'] = noShare;
    return _data;
  }
}

class Owner {
  Owner({
    required this.type,
    required this.name,
    required this.face,
  });
  late final int type;
  late final String name;
  late final String face;

  Owner.fromJson(Map<String, dynamic> json){
    type = json['type'];
    name = json['name'];
    face = json['face'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['name'] = name;
    _data['face'] = face;
    return _data;
  }
}

class Stat {
  Stat({
    required this.aid,
    required this.view,
    required this.danmaku,
    required this.reply,
    required this.favorite,
    required this.coin,
    required this.share,
    required this.nowRank,
    required this.hisRank,
    required this.like,
    required this.dislike,
    required this.evaluation,
    required this.argueMsg,
  });
  late final int aid;
  late final int view;
  late final int danmaku;
  late final int reply;
  late final int favorite;
  late final int coin;
  late final int share;
  late final int nowRank;
  late final int hisRank;
  late final int like;
  late final int dislike;
  late final String evaluation;
  late final String argueMsg;

  Stat.fromJson(Map<String, dynamic> json){
    aid = json['aid'];
    view = json['view'];
    danmaku = json['danmaku'];
    reply = json['reply'];
    favorite = json['favorite'];
    coin = json['coin'];
    share = json['share'];
    nowRank = json['now_rank'];
    hisRank = json['his_rank'];
    like = json['like'];
    dislike = json['dislike'];
    evaluation = json['evaluation'];
    argueMsg = json['argue_msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['aid'] = aid;
    _data['view'] = view;
    _data['danmaku'] = danmaku;
    _data['reply'] = reply;
    _data['favorite'] = favorite;
    _data['coin'] = coin;
    _data['share'] = share;
    _data['now_rank'] = nowRank;
    _data['his_rank'] = hisRank;
    _data['like'] = like;
    _data['dislike'] = dislike;
    _data['evaluation'] = evaluation;
    _data['argue_msg'] = argueMsg;
    return _data;
  }
}

class Dimension {
  Dimension({
    required this.width,
    required this.height,
    required this.rotate,
  });
  late final int width;
  late final int height;
  late final int rotate;

  Dimension.fromJson(Map<String, dynamic> json){
    width = json['width'];
    height = json['height'];
    rotate = json['rotate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['width'] = width;
    _data['height'] = height;
    _data['rotate'] = rotate;
    return _data;
  }
}

class Pages {
  Pages({
    required this.cid,
    required this.page,
    required this.from,
    required this.part,
    required this.duration,
    required this.vid,
    required this.weblink,
    required this.dimension,
    required this.firstFrame,
  });
  late final int cid;
  late final int page;
  late final String from;
  late final String part;
  late final int duration;
  late final String vid;
  late final String weblink;
  late final Dimension dimension;
  late final String firstFrame;

  Pages.fromJson(Map<String, dynamic> json){
    cid = json['cid'];
    page = json['page'];
    from = json['from'];
    part = json['part'];
    duration = json['duration'];
    vid = json['vid'];
    weblink = json['weblink'];
    dimension = Dimension.fromJson(json['dimension']);
    firstFrame = json['first_frame'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cid'] = cid;
    _data['page'] = page;
    _data['from'] = from;
    _data['part'] = part;
    _data['duration'] = duration;
    _data['vid'] = vid;
    _data['weblink'] = weblink;
    _data['dimension'] = dimension.toJson();
    _data['first_frame'] = firstFrame;
    return _data;
  }
}


class BVDownloadUrl {
  BVDownloadUrl({
    required this.from,
    required this.result,
    required this.message,
    required this.quality,
    required this.format,
    required this.timelength,
    required this.acceptFormat,
    required this.acceptDescription,
    required this.acceptQuality,
    required this.videoCodecid,
    required this.seekParam,
    required this.seekType,
    required this.durl,
    required this.supportFormats,
  });
  late final String from;
  late final String result;
  late final String message;
  late final int quality;
  late final String format;
  late final int timelength;
  late final String acceptFormat;
  late final List<String> acceptDescription;
  late final List<int> acceptQuality;
  late final int videoCodecid;
  late final String seekParam;
  late final String seekType;
  late final List<Durl> durl;
  late final List<SupportFormat> supportFormats;

  BVDownloadUrl.fromJson(Map<String, dynamic> json){
    from = json['from'];
    result = json['result'];
    message = json['message'];
    quality = json['quality'];
    format = json['format'];
    timelength = json['timelength'];
    acceptFormat = json['accept_format'];
    acceptDescription = List.castFrom<dynamic, String>(json['accept_description']);
    acceptQuality = List.castFrom<dynamic, int>(json['accept_quality']);
    videoCodecid = json['video_codecid'];
    seekParam = json['seek_param'];
    seekType = json['seek_type'];
    durl = List.from(json['durl']).map((e)=>Durl.fromJson(e)).toList();
    supportFormats = List.from(json['support_formats']).map((e)=>SupportFormat.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['from'] = from;
    _data['result'] = result;
    _data['message'] = message;
    _data['quality'] = quality;
    _data['format'] = format;
    _data['timelength'] = timelength;
    _data['accept_format'] = acceptFormat;
    _data['accept_description'] = acceptDescription;
    _data['accept_quality'] = acceptQuality;
    _data['video_codecid'] = videoCodecid;
    _data['seek_param'] = seekParam;
    _data['seek_type'] = seekType;
    _data['durl'] = durl.map((e)=>e.toJson()).toList();
    _data['support_formats'] = supportFormats.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Durl {
  Durl({
    required this.order,
    required this.length,
    required this.size,
    required this.ahead,
    required this.vhead,
    required this.url,
    required this.backupUrl,
  });
  late final int order;
  late final int length;
  late final int size;
  late final String ahead;
  late final String vhead;
  late final String url;
  late final List<String> backupUrl;

  Durl.fromJson(Map<String, dynamic> json){
    order = json['order'];
    length = json['length'];
    size = json['size'];
    ahead = json['ahead'];
    vhead = json['vhead'];
    url = json['url'];
    backupUrl = List.castFrom<dynamic, String>(json['backup_url']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order'] = order;
    _data['length'] = length;
    _data['size'] = size;
    _data['ahead'] = ahead;
    _data['vhead'] = vhead;
    _data['url'] = url;
    _data['backup_url'] = backupUrl;
    return _data;
  }
}

class SupportFormat {
  SupportFormat({
    required this.quality,
    required this.format,
    required this.newDescription,
    required this.displayDesc,
    required this.superscript,
  });
  late final int quality;
  late final String format;
  late final String newDescription;
  late final String displayDesc;
  late final String superscript;

  SupportFormat.fromJson(Map<String, dynamic> json){
    quality = json['quality'];
    format = json['format'];
    newDescription = json['new_description'];
    displayDesc = json['display_desc'];
    superscript = json['superscript'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['quality'] = quality;
    _data['format'] = format;
    _data['new_description'] = newDescription;
    _data['display_desc'] = displayDesc;
    _data['superscript'] = superscript;
    return _data;
  }
}
