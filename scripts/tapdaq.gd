extends Node2D

var _ads = null
onready var Production: bool = not OS.is_debug_build()
var isTop = true
var _appId: String = ''
var _clientKey: String = ''
const _amTestDevice : String = '' # 'E829E5B29F92327AAEA08E7F1A06F505'
const _fbTestDevice : String = '' # 'fe5af4bb-05f8-4235-bcc1-2b58c89155be'

onready var _gdpr_provider := $'/root/ogury' if has_node('/root/ogury') else null

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    if(Engine.has_singleton("Tapdaq")):
        _ads = Engine.get_singleton("Tapdaq")
    if ProjectSettings.has_setting('Tapdaq/AppId') and ProjectSettings.has_setting('Tapdaq/ClientKey'):
        _appId = ProjectSettings.get_setting('Tapdaq/AppId')
        _clientKey = ProjectSettings.get_setting('Tapdaq/ClientKey')
    if _gdpr_provider != null:
        _gdpr_provider.connect('gdpr_answer', self, '_on_gdpr_answer')
    elif _appId != '' and _clientKey != '':
        if not Production:
            initWithTestDevice(_appId, _clientKey, _amTestDevice, _fbTestDevice)
        else:
            init(_appId, _clientKey)

func _on_gdpr_answer(applies: bool, approval: bool, consent: String) -> void:
    if _appId != '' and _clientKey != '':
        initWithGdpr(_appId, _clientKey, applies, approval)

func init(app_id: String, client_key: String) -> void:
    if _ads != null:
        _ads.init(app_id, client_key, Production)

func initWithGdpr(app_id: String, client_key: String, applies: bool, approval: bool) -> void:
    if _ads != null:
        _ads.initWithGdpr(app_id, client_key, Production, applies, approval)

func initWithTestDevice(app_id: String, client_key: String, admobTestDevice: String = '', facebookTestDevice: String = ''):
    if _ads != null:
        _ads.initWithTestDevice(app_id, client_key, admobTestDevice, facebookTestDevice)

func debugMediation() -> void:
    if _ads != null:
        _ads.debugMediation()

func updateGdprStatus(applies: bool, approval: bool) -> void:
    if _ads != null:
        _ads.updateGdprStatus(applies, approval)

func updateAgeRestrictedStatus(age_restricted: bool) -> void:
    if _ads != null:
        _ads.updateAgeRestrictedStatus(age_restricted)

func updateCCPAStatus(applies: bool, approval: bool) -> void:
    if _ads != null:
        _ads.updateCCPAStatus(applies, approval)

func updateContentRating(rating: String) -> void:
    if _ads != null:
        _ads.updateContentRating(rating)

func updateUserId(uid: String) -> void:
    if _ads != null:
        _ads.udpateUserId(uid)

# Loaders

func loadBanner(id: String, isTop: bool, callback_id: int) -> bool:
    if _ads != null:
        _ads.loadBanner(id, isTop, callback_id)
        return true
    else:
        return false

func loadInterstitial(id: String, callback_id: int) -> bool:
    if _ads != null:
        _ads.loadInterstitial(id, callback_id)
        return true
    else:
        return false

func loadVideoInterstitial(id: String, callback_id: int) -> bool:
    if _ads != null:
        _ads.loadVideoInterstitial(id, callback_id)
        return true
    else:
        return false

func loadRewardedVideo(id: String, callback_id: int) -> bool:
    if _ads != null:
        _ads.loadRewardedVideo(id, callback_id)
        return true
    else:
        return false

func loadNative(id: String, callback_id: int) -> bool:
    if _ads != null:
        _ads.loadNative(id, callback_id)
        return true
    else:
        return false

# Check state

func bannerWidth(id: String) -> int:
    if _ads != null:
        var width = _ads.getBannerWidth(id)
        return width
    else:
        return 0

func bannerHeight(id: String) -> int:
    if _ads != null:
        var height = _ads.getBannerHeight(id)
        return height
    else:
        return 0

# Control

func showBanner(id: String) -> bool:
    if _ads != null:
        _ads.showBanner(id)
        return true
    else:
        return false

func hideBanner(id: String) -> bool:
    if _ads != null:
        _ads.hideBanner(id)
        return true
    else:
        return false

func removeBanner(id: String) -> bool:
    if _ads != null:
        _ads.removeBanner(id)
        return true
    else:
        return false

func showInterstitial(id: String) -> bool:
    if _ads != null:
        _ads.showInterstitial(id)
        return true
    else:
        return false

func showRewardedVideo(id: String) -> bool:
    if _ads != null:
        _ads.showRewardedVideo(id)
        return true
    else:
        return false

func makeZombieBanner(id: String) -> String:
    if _ads != null:
        return _ads.makeZombieBanner(id)
    else:
        return ""

func killZombieBanner(id: String) -> void:
    if _ads != null:
        _ads.killZombieBanner(id)

func showNative(id: String) -> bool:
    if _ads != null:
        _ads.showNative(id)
        return true
    else:
        return false

func removeNative(id: String) -> bool:
    if _ads != null:
        _ads.removeNative(id)
        return true
    else:
        return false

func logPurchase(sku: String, currency: String, price: float, data: String, signature: String) -> void:
    if _ads != null:
        _ads.logPurchase(sku, currency, price, data, signature)
